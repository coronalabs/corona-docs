# Goodbye Globals!

In Lua, __global__ variables and functions are risky and there are a few crucial things you should understand before you consider creating/adding one to the `_G` table <nobr>(Lua's "global table")</nobr>.

First, let's quickly discuss the `_G` table. In Lua, variables which are all uppercase and prefixed by an __underscore__&nbsp;(`_`) are considered private variables for Lua's use, for instance `_VERSION`. You should __not__ attempt to use these in your program under any circumstances. With that in mind, notice that `_G` is also uppercase and prefixed by an underscore! This means that it's a reserved structure for system use.


## Convenience of Globals

It's true that global variables and functions are convenient. In using them, you can create an object that's accessible from both `main.lua` and any other Lua module, for example a Composer scene. However, it's important to understand that the following two variables are exactly the same:

``````lua
myVariable = 10
_G.myVariable = 10
``````

In other words, Lua puts every global variable into the `_G` table, and everything you explicitly put in `_G` is available by its variable name. For&nbsp;instance:

``````lua
_G.myVariable = 20
print( myVariable )  --> Prints 20 to the console
``````

So why should you explicity put global variables in the `_G` table as in the example directly above? One reason is to clearly identify that you're declaring a global variable, as opposed to a variable that you __meant__ to be local but simply forgot to prefix with `local`. Essentially, prefixing a global declaration with `_G.` clearly indicates your intentions when you go back to inspect/modify code.


## No Harm, No Foul?

Some developers have reported that when they `print()` variables to the console, CORONA_CORE_PRODUCT's error and warning messages have stopped functioning. The likely cause is that the developer created a global variable named `debug`, meaning&nbsp;`_G.debug`, and doing so inadvertently "trashed" access to a critical internal library that CORONA_CORE_PRODUCT uses to output debug messages.

To inspect this concept further, you can `print()` the entire `_G` table using the following method:

``````lua
for k,v in pairs( _G ) do
	print( k .. " : ", v )
end
``````

Running this will output the full contents of `_G`, including:

``````
_G :        table: 0x610000468580
_VERSION :  Lua 5.1
package :   table: 0x600000870300
tostring :  function: 0x60000024d290
print :     function: 0x60000024c870
lpeg :      table: 0x610000463180
os :        table: 0x600000a6c240
unpack :    function: 0x60000024cf00
lfs :       table: 0x610000469e80
require :   function: 0x60000067af00
debug :     table: 0x600000270a80
``````

All of the APIs listed in the [API Reference][api] under the [(globals)][api.library.global] entry are contained, as well as some undocumented items like `debug` and several core API groups like `math`, `string`, and `audio`. With this in mind, you might assume that you can write code like this:

``````lua
_G.audio = true  -- Play audio if true, don't play if false
_G.type = "Gold"
_G.timer = timer.performWithDelay( 1000, doSomething )
``````

However, all this does is "trash" these internal CORONA_CORE_PRODUCT libraries, meaning you won't be able to play audio or use the `type()` function&nbsp;&mdash; and that timer isn't going to time anything!

You may think that the solution is to simply avoid __those__ global names. Not so fast! The list output by the loop above indicates the libraries that you shouldn't overwrite today, based on an otherwise empty `main.lua` file. That list also assumes that you haven't <nobr>`require()`-d</nobr> any additional libraries or modules, whether they be CORONA_CORE_PRODUCT libraries like [physics][api.library.physics], your own modules, or <nobr>third-party</nobr> libraries/plugins. In addition, other things may slip into the global space that you're simply not aware of.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Another reason why globals are dangerous is that&nbsp;&mdash; because they have no visibility limits&nbsp;&mdash; they can be expensive to use in regards to performance. In fact, if a global variable is accessed in a <nobr>time-critical</nobr> loop, it may perform as much as 30% worse than a local variable in the same loop.

</div>
</div>


## Avoiding Globals

Some developers use&nbsp;&mdash; and sometimes abuse&nbsp;&mdash; globals as a way to access something they haven't declared yet, or access variables/functions between modules. Fortunately, both of these tasks are easy to accomplish __without__ using globals!

### Forward Declarations

The first case&nbsp;&mdash; accessing something you haven't declared yet&nbsp;&mdash; can be solved by the __forward&nbsp;declaration__ method. As a Lua/CORONA_CORE_PRODUCT programmer, understanding __scope__ is essential. If you need to use a variable (usually&nbsp;a&nbsp;function) before you declare it, simply <nobr>forward-declare</nobr> a variable and use the alternate function declaration syntax like this:

``````{ brush="lua" gutter="true" first-line="1" }
local doSomething  -- Forward declaration

local function makeSomethingHappen()
	local count = 10
	doSomething( count )
end

doSomething = function( count )  -- Assign function to forward declaration
	print( count )
end

makeSomethingHappen()
``````

On line&nbsp;8, we simply assign the function which will do the work to the variable `doSomething` which was <nobr>forward-declared</nobr> on line&nbsp;1. In this way, the `makeSomethingHappen()` function <nobr>(lines 3-6)</nobr> becomes aware of the `doSomething()` function since it was declared "above" the code block which requests it.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

To learn more about Lua scope and the importance of obeying scope rules, please see the [Scope for Beginners][tutorial.basics.scope] tutorial.

</div>
</div>

### Data Module

To solve the second case&nbsp;&mdash; accessing variables between modules&nbsp;&mdash; you can simply create a Lua file named `globalData.lua` (or&nbsp;similar) with the following contents:

``````lua
-- Pseudo-global space
local M = {}

return M
``````

Then, in each of your Lua modules, simply `require()` the module as follows:

``````lua
local globalData = require( "globalData" )
``````

From there, setting a "global" variable is as easy as this:

``````lua
globalData.playerName = "John Smith"
``````

And reading a value from any module&nbsp;&mdash; assuming you included <nobr>`local globalData = require( "globalData" )` &mdash;</nobr> is as simple as this:

``````lua
local currentPlayer = globalData.playerName
``````

As you can see, this method lets you use the `globalData` table just like you would `_G` and circumvent the risk of overwriting things in the `_G` table, as well as avoid the general issues and pitfalls that come along with globals.


## Conclusion

We've always emphasized the "avoid&nbsp;globals!" stance and, as you can see by the methods above, there is essentially no further need for global variables or functions. With careful scoping and use of a <nobr>pseudo-global</nobr> module, you can accomplish everything you need without them.
