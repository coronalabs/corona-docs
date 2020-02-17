# Scope for Beginners

As a new &mdash; or relatively new&nbsp;&mdash; Lua/Corona programmer, are you confused by console errors like this?

``````
Runtime error /Users/yourname/Projects/AwesomeGame\menu.lua:4: attempt to index global 'button' (a nil value)
stack traceback:
	[C]: in function 'error'
	?: in function 'gotoScene'
	/Users/yourname/Projects/AwesomeGame\main.lua:16: in main chunk
``````

If so, then you need to learn a very important programming concept known as __scope__. Scope impacts Lua's ability to "see" variables <nobr>(as in the error above)</nobr> as well your ability to manage where functions exist in relation to other functions and variables.


## Scope Defined

When you think of terms like "telescope" or "microscope," you think of devices that help you see, and see things within a limit&nbsp;&mdash; for instance, very small things in a microscope. In programming terms, scope is used to define what parts of your code can "see" variables, objects, and functions that you have created. In Lua, there are two main scope controls: __global__ and __local__.


## Global

<div class="float-right" style="max-width: 130px; margin-bottom: 16px; clear: both;">

![][images.docs.warning-sign]

</div>

Global variables/functions can be seen anywhere in your program. "Great, I'll use global scope for everything!" you might say, but global objects can actually be quite bad! In fact, __new&nbsp;programmers should avoid using global&nbsp;variables__.

One reason why globals are dangerous is that&nbsp;&mdash; because they have no visibility limits&nbsp;&mdash; they can be expensive to use in regards to performance. In fact, if a global variable is accessed in a <nobr>time-critical</nobr> loop, it may perform as much as 30% worse than a __local__ variable in the same loop.

Global variables/functions also have the inherent risk of being accidentally <nobr>re-assigned</nobr>. For instance, if you create a global variable named `_W` in one Lua file and assign it a value of `320`, you may accidentally create another global variable `_W` in another file, assign it a different value, and effectively "trash" the first declaration. This could obviously have unexpected consequences in the first file which expects `_W` to have a value of `320`!

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

The global scope is discussed in more detail in the [Goodbye Globals!][tutorial.basics.globals] tutorial, along with a convenient method to create/access <nobr>pseudo-global</nobr> variables and functions.

</div>
</div>


## Local

In Lua, the preferred scope is __local__ which you control by using the `local` declaration before you define a variable/function. For example:

``````lua
local someVariable
``````

``````lua
local function someFunction()

end
``````

When you prefix a variable or function with `local` when you first create it, it becomes available to that block of code and any "children" blocks contained within<!--- (if you are not familiar with the concept of blocks, please read the previous tutorial: https://coronalabs.com/blog/2015/06/09/tutorial-the-value-of-well-formatted-code/) -->. This concept is highlighted by the following two examples:

1. Consider this instance:

<div class="code-indent">

``````lua
local function addTwoNumbers( number1, number2 )

	-- Create variable "sum" local only to this "addTwoNumbers()" function
	local sum = number1 + number2
	print( sum )  -- This works!
end

print( sum )  -- This does NOT work (prints "nil" meaning it's unknown to Lua)
``````

In this case, the function `addTwoNumbers()` defines a new __block__ of code. Inside this block, we create a new variable named `sum`. This variable has the `local` keyword, meaning it's only visible to the function `addTwoNumbers()`&nbsp;&mdash; no&nbsp;other code in this module or overall project will be able to "see" the `sum` variable. Thus, when the function ends, there is no longer a variable known as `sum` and `nil` will be printed to the console.

</div>

2. Now consider this block:

<div class="code-indent">

``````lua
local function addTwoNumbers( number1, number2 )

	local sum = number1 + number2
	if sum < 10 then
		print( sum .. " is less than 10" )
		local secondSum = sum + 10
	end

	print( secondSum )  -- This does NOT work (prints "nil" meaning it's unknown to Lua)
end
``````

Like the first example, `sum` is local to `addTwoNumbers()`. That lets us add two numbers, and it's also visible inside the block started by <nobr>`if sum < 10 then`</nobr>. However, inside of that <nobr>`if-then`</nobr> block, another local variable (`secondSum`) is created, and that variable becomes local __only__ to the <nobr>`if-then`</nobr> block. So, the attempt to print `secondSum` __outside__ of the <nobr>`if-then`</nobr> block results in `nil` because `secondSum` doesn't exist at that point in execution.

</div>


## Index Variables in Loops

Consider a block of code like this:

``````{ brush="lua" gutter="true" first-line="1" }
local i = 999

for i = 1, 10 do
	print( i )  -- prints 1, 2, 3, .. 10
end

print( i )  -- prints 999
``````

Here, a local variable `i` is set to `999` on line&nbsp;1. In addition, a __loop&nbsp;index&nbsp;variable__ of `i` (line&nbsp;3) is used, but this `i` is local __only__ to the `for` loop. As the loop executes, its value represents the values <nobr>`1`-`10`</nobr> and that is reflected by the <nobr>`print( i )`</nobr> command on line&nbsp;4. When the loop ends, this `i` will forget its final value from the loop and return to its previous definition (usually&nbsp;`nil`). Following that, the local variable `i` which was declared __before__ the `for` loop is printed to the console (<nobr>`print( i )` on line 7</nobr>) with the value of `999`. This is because for loops&nbsp;&mdash; just&nbsp;like functions&nbsp;&mdash; are blocks and they adhere to the same scope rules associated with blocks.


## Conclusion

Hopefully, this tutorial has illustrated that scope, as an overall concept, is relatively straightforward. When you use the keyword `local`, the variable can only be accessed at that block level or within any child blocks. With that in mind, if your variables or functions need to be seen at a wider level, simply move them above/outside the block or define them near the top of the module.
