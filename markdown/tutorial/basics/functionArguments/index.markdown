# Passing Data To/From Functions

When people first start programming, they quickly learn that writing all of their code in one large chunk becomes difficult to manage. As such, modern programming languages like Lua support a concept called __functions__ which allow the programmer to direct parts of the program to perform a specific task. In addition to writing clean, organized code, functions are the foundation behind the concept of __DRY__ or <nobr>"Don't Repeat Yourself."</nobr>

If you find yourself writing the same basic block of code multiple times, with only minor differences in each block, using a function is the best solution. Also, any time you want to do the same thing multiple times, a function is the best approach.


## Similar Task Functions

Let's consider a scenario where we only need to change a small portion of code around a single data value:

``````lua
local tanx = math.abs( 12 ) / math.abs( 15 )
local atanx = math.atan( tanx )  -- Result in radians
local angle = atanx * 180 / math.pi  -- Converted to degrees

print( angle )

tanx = math.abs( 34 ) / math.abs( -16 )
atanx = math.atan( tanx )  -- Result in radians
angle = atanx * 180 / math.pi  -- Converted to degrees

print( angle )

tanx = math.abs( 80 ) / math.abs( -4 )
atanx = math.atan( tanx )  -- Result in radians
angle = atanx * 180 / math.pi  -- Converted to degrees

print( angle )
``````

In this block, we are simply calculating an angle based on the width and height of a triangle. As you can see, this code quickly becomes repetitive&nbsp;&mdash; we are basically doing the exact same thing several times over, changing only the parameters of the triangle each time. This is a prime example of where a function is useful, so let's look at a <nobr>re-write</nobr> of this code using a function:

``````lua
local function calculateAngle( sideA, sideB )

	local tanx = math.abs( sideB ) / math.abs( sideA )
	local atanx = math.atan( tanx )  -- Result in radians
	local angle = atanx * 180 / math.pi  -- Converted to degrees
	return angle
end

print( calculateAngle( 15, 12 ) )
print( calculateAngle( -16, 34 ) )
print( calculateAngle( -4, 80 ) )
``````

Notice that we have written the basic code just once, but we use variables <nobr>(`sideA` and `sideB`)</nobr> to do the calculations. After the function block, we output the `return` value from the `calculateAngle()` function three times, using number values similar to the original version (the&nbsp;usage of `return` will be discussed in detail&nbsp;below).


## Sending Data In

Data is sent to functions as __parameters__, or "arguments" as some developers refer to them. These are passed to the function as a <nobr>comma-separated</nobr> list of values/variables within the function's parentheses (`()`), for example:

``````lua
local picWidth = 32
local pic = display.newImageRect( "pic.png", picWidth, 64 )
``````

In this example, we call a common CORONA_CORE_PRODUCT function, `display.newImageRect()`, and pass to it:

1. A string value (`"pic.png"`).
2. A variable (`picWidth`).
3. A number (`64`).

Spacing between the commas isn't required, but string values must be passed within quotes while variables and numbers must be passed __without__ quotes. Other items can be passed as well, including tables of data and even other functions. Essentially, any valid Lua data type can be passed to a Lua function.

Let's look at some more examples:

``````lua
local result = myFunction( "test" )
``````

``````lua
local myString = "test"
local result = myFunction( myString )
``````

These two cases are identical in behavior, except that, in the second version, the sole parameter is <nobr>pre-declared</nobr> as the variable `myString`. 

Here's another equivalent set which passes in a table:

``````lua
local result = myFunction( { 1, 2, 3 } )
``````

``````lua
local myTable = { 1, 2, 3 }

local result = myFunction( myTable )
``````

``````lua
local myTable = {}
myTable[1] = 1
myTable[2] = 2
myTable[3] = 3

local result = myFunction( myTable )
``````

Here, you can see that the exact same result&nbsp;&mdash; a table containing a sequence of values&nbsp;&mdash; is passed to `myFunction()`. How you choose to pass data in is entirely up to you, and it may simply depend on the amount of flexibility you need.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

As illustrated so far, functions can accept parameters of one data type or a __mix__ of data types. As a developer, it's your responsibility to ensure that the values passed to your function are what you expect them to be&nbsp;&mdash; don't be careless and pass a string when you intend it to be a number or <nobr>vice-versa</nobr>.

</div>
</div>


## Parameter Names

Parameter names should be whatever makes sense to you&nbsp;&mdash; they are not required to be anything in particular. However, if you don't use logical and complete names, someone inspecting your code later (or&nbsp;even&nbsp;you!) might have trouble understanding what values the function is expecting. Let's inspect a touch handling function as an example:

``````lua
local function handleTouch( event )

	if ( event.phase == "ended" ) then
		-- Handle touch lifting off screen
	end
	return true
end
``````

This function requires just a single parameter, `event`, which is a Lua table that represents the "event" of the user touching the screen. Assuming this function is used as a __listener__ function via a command like <nobr>`Runtime:addEventListener( "touch", handleTouch )`</nobr>, this table contains various values, including the "phase" of the event and the __x__/__y__ location of the touch coordinates on the screen.

Note that some programmers may write the same function as follows:

``````lua
local function handleTouch( e )

	if ( e.phase == "ended" ) then
		-- Handle touch lifting off screen
	end
	return true
end
``````

These functions are identical in behavior except that the parameter name `event` has been shortened to `e`. While `e` isn't a descriptive name, it demonstrates that the name itself doesn't matter&nbsp;&mdash; however, it's good practice to name parameters sensibly so you don't forget the purpose sometime in the future.


## Getting Data Out

Frequently, it's necessary to __retrieve__ data from a function. In the first example of this tutorial, we needed to get the `angle` value based on the parameters we passed in. Fortunately, this is easily accomplished via the simple `return` command, followed by the values to return:

``````{ brush="lua" gutter="false" first-line="1" highlight="[6]" }
local function calculateAngle( sideA, sideB )

	local tanx = math.abs( sideB ) / math.abs( sideA )
	local atanx = math.atan( tanx )  -- Result in radians
	local angle = atanx * 180 / math.pi  -- Converted to degrees
	return angle
end
``````

### Values, Plural?

Unlike most other programming languages, Lua allows a function to return __multiple__ values (other&nbsp;languages usually return just&nbsp;one). If you need to return multiple values from a Lua function, just provide a <nobr>comma-separated</nobr> list of values to `return` and, when you call the function, provide unique variables for __each__ value returned. Compare the difference:

``````{ brush="lua" gutter="false" first-line="1" highlight="[2,5]" }
local function returnOneNumber()
	return 10
end

local value = returnOneNumber()
``````

``````{ brush="lua" gutter="false" first-line="1" highlight="[2,5]" }
local function returnTwoNumbers()
	return 10, 20
end

local value1, value2 = returnTwoNumbers() 
``````

Notice that because the second function returns __two__ values, it logically needs two variables, `value1` and `value2`, to store the returned values.

This multiple return concept can be directly observed via the CORONA_CORE_PRODUCT API `myObject:getLinearVelocity()`, a physics function which retrieves the current linear velocity of a physical object. Because a physical linear velocity always consists of two velocity values, horizontal&nbsp;(__x__) and vertical&nbsp;(__y__), this function is typically called like this:

``````lua
local linearVelocityX, linearVelocityY = myObject:getLinearVelocity()
``````

Note, however, that you don't need to store __all__ returned values as separate variables. For example, if you only care about the linear __x__ velocity of the physical object, just store that value and the linear __y__ value will be discarded:

``````lua
local linearVelocityX = myObject:getLinearVelocity()
``````


## Variable Number of Parameters

Sometimes a function may need to accept a variable number of parameters. Lua accommodates for this with the variable parameter `...` syntax. Consider the following function which takes an unspecified amount of numerical arguments and adds them together into one sum:

``````lua
local function addNumbers( ... )

	local sum = 0

	for i = 1,#arg do
		sum = sum + arg[i]
	end

	return sum
end

local finalSum =  addNumbers( 1, 12, 4, 5, 2 )
print( finalSum )
``````

Here, notice how Lua uses three consecutive periods (`...`) to indicate a varying number of arguments and, once inside the function, this produces a table called `arg` which is a <nobr>numerically-indexed</nobr> table (array) that can be iterated over to access each of the arguments:

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7]" }
local function addNumbers( ... )

	local sum = 0

	for i = 1,#arg do
		sum = sum + arg[i]
	end

	return sum
end
``````


## Conclusion

Hopefully this tutorial has helped you understand the nature of functions, their considerable usefulness, how to pass data of different types to functions, and how to retrieve the information you need. Remember that clean coding and smart use of functions will improve the structure and performance of your app, as well as make the program code easier to understand.
