# Understanding Colon and Dot Operators

Many programmers learning Lua for the first time struggle with the difference between a function call that uses a colon (`:`) to separate the method from the object and a call that uses a dot/period (`.`) to separate them. Let's begin by looking at two examples:

``````lua
local length = string.len( "Hello World" )
``````

``````lua
Runtime:addEventListener( "enterFrame", gameLoop )
``````

In the first example, `string` is the __object__ and `len` is one of its __methods__ (in&nbsp;this case, it gets the length of the&nbsp;string).

The second example calls the `Runtime` object's __method__ `addEventListener`, along with some parameters/arguments.


## Which Should I Use?

Deciding whether to use the colon or dot syntax can often be determined by whether you need a __reference&nbsp;to&nbsp;the&nbsp;object__ within the function. This is, of course, irrelevant for standalone functions, but it can be extremely important for functions which are defined as __methods&nbsp;of&nbsp;objects__.

Consider this generic module:

``````{ brush="lua" gutter="true" first-line="1" }
local object = {}

function object.dotMethod( parameter1, parameter2 )

end

function object:colonMethod( parameter1, parameter2 )

end
``````

First, we set up an object (`object`)&nbsp;&mdash; in this case, just an empty Lua table.

Next, for the first function, we define a __method__ of `object` called `dotMethod()`, and this method expects two parameters: `parameter1` and `parameter2`. However, the method knows nothing about the object that it's associated with, and that may be limiting.

The second function, `colonMethod()`, has one major difference&nbsp;&mdash; it uses the colon (`:`) operator and, as a result, the method has an additional "invisible" parameter called `self`. As you can probably guess, this `self` parameter is a reference to the object itself, in this case `object`. This can be tested by expanding on the code above:

``````{ brush="lua" gutter="true" first-line="1" }
local object = {}

function object.dotMethod( parameter1, parameter2 )
	print( self.someNumber )
end

function object:colonMethod( parameter1, parameter2 )
	print( self.someNumber )
end

object.someNumber = 10
object.dotMethod( "Hello", "World" )    -- Dot method called with dot operator
object:colonMethod( "Hello", "World" )  -- Colon method called with colon operator
``````

Running this code, you can see that the result in the console is:

``````lua
nil
10
``````

Why the difference? As explained above, the implicit `self` parameter is __not__ included in the dot operator method, so Lua outputs `nil`. In contrast, the `self` parameter __is__ accessible in the colon operator method, so Lua recognizes `self` and `object` as the same, along with the `someNumber` property we added, and thus the output is `10`.

<!---

Alternatively, you could rewrite the `dotOperator()` function to accept an additional parameter named `self` and then pass in the `object` reference as that parameter:

``````lua
local object = {}

function object.dotMethod( self, parameter1, parameter2 )  -- Add "self" as additional first parameter
	print( self.someNumber )
end

object.someNumber = 10
object.dotMethod( object, "Hello", "World" )  -- Pass "object" as first parameter
``````

This code will now output `10`, but it requires additional code which can simply be omitted by using the colon operator method.

-->


## Be Careful!

Note that using the dot or the colon at the wrong time can cause errors in your code. The Lua compiler will tell you exactly what the problem is, but deciphering the error message can be tricky. Consider the following example:

``````{ brush="lua" gutter="true" first-line="1" }
local object = {}

function object:colonMethod( parameter1, parameter2 )
	print( self )
	print( parameter1 .. " " .. parameter2 )
end

object.colonMethod( "Hello", "World" )  -- COLON method called with DOT operator (incorrect)
``````

Running this code will generate this error:

``````
lua: mymodule.lua:5: attempt to concatenate local 'parameter2' (a nil value)
stack traceback:
mymodule.lua:5: in function 'colonMethod'
mymodule.lua:8: in main chunk
``````

Basically, this error message tells you that `parameter2` is `nil`, however this may be confusing since both parameters are clearly passed in. The reason for the error is because, as explained above, the colon method has `self` as the implicit first parameter, so as far as the function is concerned, the parameters are:

1. `self` &rarr; `"Hello"`
2. `parameter1` &rarr; `"World"`
3. `parameter2` &rarr; `nil`

In contrast, try calling the function correctly like this:

``````lua
object:colonMethod( "Hello", "World" )  -- COLON method called with COLON operator (correct)
``````

Now, the results are as expected and, from the function's standpoint, the parameters are:

1. `self` &rarr; `object`
2. `parameter1` &rarr; `"Hello"`
3. `parameter2` &rarr; `"World"`


## Conclusion

Armed with this information, you can better understand when to use the colon operator and when to use the dot operator, thus ensuring that your code is logical and <nobr>bug-free</nobr>.
