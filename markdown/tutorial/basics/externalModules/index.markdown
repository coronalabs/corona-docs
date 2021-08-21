# Using External Modules

There's often confusion as to what exactly happens when external modules are "required" into your code, which leads to further confusion and unexpected behavior when it comes to things such as Composer scenes or even custom modules of your own.

This tutorial will guide you through a series of exercises (with&nbsp;explanations) that should illustrate exactly how modules work in Lua, so you get a full understanding of when (and&nbsp;which) code in your modules is executed.


## Including External Modules

In its simplest form, an __external&nbsp;module__ is simply a Lua file that returns something, most likely a table. It can almost be thought of as a function definition, but it's contained in a file all to itself.

Here's a really simple module, `example1.lua`, which simply prints a statement to the console and returns an empty table:

``````lua
-- example1.lua
 
local M = {}

print( "example1.lua has been loaded" )

return M
``````

Now, in a different module&nbsp;&mdash; let's just use `main.lua`&nbsp;&mdash; require the `example1.lua` module and see what happens (note&nbsp;that all code examples in this tutorial assume that the custom external modules are placed in the root level of your project folder, alongside&nbsp;`main.lua`).

``````lua
-- main.lua
 
local ex1 = require( "example1" )

ex1.testvar = "Hello World!"
``````

As expected, upon execution of the first command, the variable `ex1` becomes equal to the empty table (`M`) which we created and returned in `example1.lua`, and the words <nobr>`example1.lua has been loaded`</nobr> appear in the console.

In the next command, we assign a trivial property, `testvar`, to this `ex1` table.

Pay close attention now since this gets more tricky. Let's require `example1.lua` in an __another__ module, `scene1.lua`, __after__ we have already required it within `main.lua`:

``````lua
-- scene1.lua (previous "main.lua" still applies)

local examp1 = require( "example1" )

print( examp1.testvar )
``````

This time&nbsp;&mdash; in `scene1.lua`&nbsp;&mdash; when you require the `example1.lua` module, the words <nobr>`example1.lua has been loaded`</nobr> do __not__ appear in the console. However, when you print the value of `examp1.testvar`, <nobr>`Hello World!`</nobr> is output which means that the `testvar` property exists! What can we learn from this? Read&nbsp;on...


## The "package.loaded" Table

The reason why <nobr>`example1.lua has been loaded`</nobr> did __not__ appear in the console is because the module was __already&nbsp;loaded__ by `main.lua`. Essentially, when a module is loaded (required), its code is executed from top to bottom as usual, and the return value of the module is stored in a global table called `package.loaded`. From that point on, the module is considered "loaded" and it can't simply be <nobr>re-loaded</nobr> fresh by requiring it again.

Let's explore this in a bit more detail:

* When you call `require()`, the first thing that happens is the `package.loaded` table is checked to see if the module was previously loaded.

* If it __is__ found, then instead of <nobr>re-requiring</nobr> the external module, the stored return value in `package.loaded` is returned. In other words, this returned value is a __reference__, not a copy. Thus, if your module returns a table, that's the same table you'll get (properties&nbsp;and&nbsp;all) when you call `require()` on the same module in the future.

* If the module is __not__ found in `package.loaded`, the module will be loaded, the code will run from top to bottom, and the return value of the module will be stored in the `package.loaded` table for any future requires of the module. This explains why <nobr>`example1.lua has been loaded`</nobr> was __not__ shown again&nbsp;&mdash; because `example1.lua` was already required within `main.lua`, it is not <nobr>re-loaded</nobr> in `scene1.lua`.


## Executing Module Code

There are two ways to get code within a module to run:

1. Put the code inside a function (within&nbsp;the&nbsp;module) and call it like a normal function.

2. Remove the module from the `package.loaded` table and <nobr>re-require</nobr> it (generally&nbsp;not&nbsp;recommended).

Here's an example of the first scenario:

``````lua
-- example2.lua
 
local M = {}

print( "example2.lua has been loaded" )
 
M.hello = function()
	print( "Hello World!" )
end

return M
``````

``````lua
-- main.lua

local ex2 = require( "example2" )  --> example2.lua has been loaded

ex2.hello()  --> Hello World!
``````

``````lua
-- scene1.lua

local examp2 = require( "example2" )

examp2.hello()  --> Hello World!
``````

As you can see, we required `example2.lua` in two different modules, `main.lua` and `scene1.lua`. The first `print()` statement&nbsp;&mdash; the one outside of any functions&nbsp;&mdash; occurs only once (the&nbsp;first time the module is required within&nbsp;`main.lua`). In contrast, the second `print()` statement&nbsp;&mdash; the one within the `M.hello` function&nbsp;&mdash; is executed each time that function is called.

What is the lesson learned? Essentially, if you want to run code within a module more than once, or if you don't want to run it immediately upon requiring the module, you should wrap it within a function and "attach" the function to the table which you return at the end of the module.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Properly "attaching" module functions to the returned table is essential to gain access to them. You can not simply include the function within the module as a local function and then expect access to it from another module. Notice the difference:

``````lua
local M = {}
 
-- This function WILL be accessible outside of this module, wherever the module is required
M.hello = function()
	print( "Hello World!" )
end

-- This function will NOT be accessible outside of this module, only within it locally
local hello = function()
	print( "Hello World!" )
end

return M
``````

</div>


## Removing Modules

As outlined above, you require a module like `example2.lua` using the following syntax:

``````lua
local ex2 = require( "example2" )
``````

With this, the return value of `example2.lua` is effectively stored in the `package.loaded` table under:

``````lua
package.loaded["example2"]
``````

Thus, if you want to <nobr>"un-require"</nobr> a module and clear it from memory entirely, simply assign `nil` to this reference as follows:

``````lua
package.loaded["example2"] = nil
``````

At this point, the module will be cleared from memory and all of its associated function(s) will cease to exist.


## Conclusion

Hopefully this tutorial has given you a solid foundational understanding of Lua modules, how to include them, and how to call functions that exist in one module from another module. Conveniently, these rules are universal and apply to any module you may be dealing with, whether it's your own <nobr>custom-made</nobr> module, a module you downloaded, or even <nobr>built-in</nobr> CORONA_CORE_PRODUCT modules.
