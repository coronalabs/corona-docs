# Anonymous Functions and Closures

This tutorial discusses the basics behind __anonymous functions__ and __closures__ in Lua. To begin, let's inspect how a typical Lua function looks:

``````lua
local function myFunction( parameters )
	-- Function content
end
``````

Under the hood, this creates a variable called `myFunction` that is scoped locally to this code block and is stored where the code block exists in memory. For instance, if you execute <nobr>`print( myFunction )`</nobr>, the console will print something like `0x4a8cd834`. Basically, this is the location in memory where Lua will jump when the function is called.

Lua also permits you to define a function like this:

``````lua
local myFunction = function( parameters )
	-- Function content
end
``````

In this notation, it's more clear that you're assigning a variable to a code block, or more specifically the memory address of that code block. In the end, both notations accomplish the same thing, but the second notation allows some additional flexibility. When written in this form, you are effectively taking an unnamed block of code and giving it a name.


## Anonymous Functions

As yet another option, Lua permits you to write a function without a name. This is called an __anonymous&nbsp;function__. To understand the difference between regular functions and anonymous functions, let's look at some examples:

``````lua
local function myFunction( parameters )
	-- Function content
end

timer.performWithDelay( 1000, myFunction, 10 )
``````

In this case, the `timer.performWithDelay()` function is given a time interval of 1000 milliseconds, a function to execute, and an integer count to repeat. Effectively, `myFunction()` will fire 10 times at an interval of 1000 milliseconds, but what's internally happening is that Lua is passing the __memory&nbsp;address__ of the `myFunction()` function to the `timer.performWithDelay()` function. 

This means that you could also write either of these commands:

``````lua
timer.performWithDelay( 1000,
	function()
		print( "Hello World" )
	end,
10 )
``````

``````lua
timer.performWithDelay( 1000, function() print( "Hello World" ); end, 10 )
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

In the second example, notice the __semicolon__ (`;`) following the <nobr>`print( "Hello World" )`</nobr> command. If you write an anonymous function with multiple commands on one line, each command __must__ be followed by a semicolon, indicating to Lua where each new command begins.

</div>
</div>

In both cases, instead of using a variable which references a function's memory address, you simply create an unnamed __anonymous&nbsp;function__ that will execute when the timer fires. 


## When to Use Them

Anonymous functions are most useful when you need to code an `onComplete` or callback listener function, for example in `timer.performWithDelay()`, `transition.to()`, or `audio.play()`&nbsp;&mdash; but how often should you use them? From the perspective of code readability and sustainability, perhaps not very often, but if the function will only be used in that __specific__ scope of your code, and it's relatively short, anonymous functions are a perfectly valid coding technique.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Note that there are times when you can __not__ use anonymous functions. One specific instance is when you assign functions to event listeners. Because the event listener system in CORONA_CORE_PRODUCT is based around storing the address of functions that are specified to handle events, the address that you pass in when removing an event listener via `object:removeEventListener()` must match the address that was passed in to `object:addEventListener()`.

</div>
</div>


## Lua Closures

Lua closures are another useful technique. Where they truly shine is in passing parameters to function handlers that are not looking for extra parameters. To illustrate this, let's look at a `transition.to()` example:

``````lua
local function myFunction( parameters )
	-- Function content
end

transition.to( playerObject, { time=1000, alpha=0, onComplete=myFunction } )
``````

In this example, `myFunction()` will be passed a single parameter, `target`, which is the object that is transitioning. But let's assume that the display object is a member of an array and you need to know more about the object itself in the function that gets called. This can be accomplished via a __Lua&nbsp;closure__:

``````lua
local function myFunction( parameters )
	-- Function content
end

local balls = {}
balls[1].ball = display.newImageRect( "greenball.png", 64, 64 )
balls[1].color = "green"
balls[2].ball = display.newImageRect( "redball.png", 64, 64 )
balls[2].color = "red"

for i = 1,#balls do
	transition.to( balls[i].ball,
		{ time=250, x=200,
			onComplete=function( target )
				myFunction( target, balls[i].color )
			end
		}
	)
end
``````

In this example, instead of calling `myFunction()` as part of the callback, you call an anonymous function instead. That anonymous function takes the received `target` parameter that `transition.to()` provides and, inside it, you call your __named__ function, passing along the `target` object reference and the `color` property of the ball.

Closures are more than just anonymous functions. When you have a function inside of a function, the child function has access to all of its parent's local objects, or __upvalues__. Normally, when a function ends, any <nobr>locally-scoped</nobr> variables go out of scope, so when you call the function again, you begin anew. Consider this example:

``````{ brush="lua" gutter="true" first-line="1" }
local function counter()

	local i = 0
	while i < 10 do
		i = i + 1
	end
	return i
end

print( counter() )
``````

In this case, when you call the `counter()` function, it will print the value of `10` because when the function's scope ends, so do its local variables.

Now let's modify the function to actually return a function that does the counting:

``````{ brush="lua" gutter="true" first-line="1" }
local function counter()

	local i = 0
	return function ()
		i = i + 1
		return i
	end
end

local counter1 = counter()

print( counter1() )  --> 1
print( counter1() )  --> 2
``````

Following line 10, we have a new function in the `counter1` variable, and when we run it multiple times, Lua realizes that the anonymous function may still get used and that it should hold on to the current value of `i` in its current scope. This is what a Lua closure can do for you.

To expand on this concept, if you were to create another counter, the following results will occur:

``````lua
local counter2 = counter()

print( counter1() )  --> 3
print( counter2() )  --> 1
print( counter1() )  --> 4
print( counter2() )  --> 2
``````

Essentially, each version of the anonymous function holds its own `i` and keeps it scoped within itself. So, when you create a second counter, `i` resets to `0` for that instance.


## Conclusion

As you can see, anonymous functions and closures provide a powerful way to keep track of variable instances on a <nobr>per-function</nobr> basis. In the context of CORONA_CORE_PRODUCT, this allows you to pass parameters to functions in which you normally don't control the <nobr>passed-in</nobr> content.
