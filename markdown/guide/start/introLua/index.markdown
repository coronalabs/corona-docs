# Introduction to Lua

Lua is an extension programming language designed to support general procedural programming with data description facilities. Lua is intended to be used as a powerful, lightweight scripting language for any program that needs one.

<div class="guides-toc">

* [Conventions](#conventions)
* [Types and Values](#typesvalues)
* [Tables](#tables)
* [Variables](#variables)
* [Expressions](#expressions)
* [Functions](#functions)
* [Scope Rules](#scope)
* [Memory Allocation](#memory)
* [Syntax Comparison](#syntax)
* [Lua Functions](#luafunctions)

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Corona uses Lua version 5.1.3. Please see the [Lua 5.1 Reference Manual](http://www.lua.org/manual/5.1/) for more details.

</div>


<a id="conventions"></a>

## Conventions

__Names__ (also called __identifiers__) in Lua can be any string of letters, digits, and underscores, not beginning with a digit. This coincides with the definition of names in most languages. The definition of "letter" depends on the current locale: any character considered alphabetic by the current locale can be used in an identifier. Identifiers are used to name variables and table fields.

The following keywords are __reserved__ and cannot be used as names:

``````
 and     break        do         else     elseif     end       false
 for     function     if         in       local      nil       not
 or      repeat       return     then     true       until     while
``````

The following strings denote other tokens:

``````
 +      -      *      /      %      ^      #
 ==     ~=     <=     >=     <      >      =
 (      )      {      }      [      ]
 ;      :      ,      .      ..     ...
``````

Lua is a __case-sensitive__ language: `and` is a reserved word, but `And` and `AND` are two different, valid names. As a convention, names starting with an underscore followed by uppercase letters <nobr>(such as `_VERSION`)</nobr> are reserved for internal global variables used by Lua.

A __comment__ starts with a double hyphen (`--`) anywhere outside a string. They run until the end of the line. You can comment out a full block of code by surrounding it with `--[[` and `--]]`. To uncomment the same block, simply add another hyphen to the first enclosure, as in `---[[`.

``````lua
-- Single line commented out

--[[ Entire block commented out
print( 10 )
print( 15 )
--]]
``````

A __numerical constant__ can be written with an optional decimal part and an optional decimal exponent. Lua also accepts integer hexadecimal constants, by prefixing them with `0x`. Examples of valid numerical constants are:

``````
 3    3.0    3.1416    314.16e-2    0.31416E1    0xff    0x56
``````




<a id="typesvalues"></a>

## Types and Values

Lua is a __dynamically typed language__. This means that variables do not have types; only values do. There are no type definitions in the language. All values carry their own type.

All values in Lua are __first-class values__. This means that all values can be stored in variables, passed as arguments to other functions, and returned as results.

The basic types you should be concerned with are:

* __nil__ — the type of the value `nil`, whose main property is to be different from any other value; it usually represents the absence of a useful value.

* __boolean__ — the type of the values `false` and `true`. Both `nil` and `false` make a condition false; any other value makes it true.

* __number__ —  represents real (double-precision floating-point) numbers.

* __string__ — represents arrays of characters. Lua is <nobr>8-bit</nobr> clean: strings can contain any <nobr>8-bit</nobr> character, including embedded zeros.

* __function__ — see [Functions](#functions) for more information.

* __table__ — the sole data structuring mechanism in Lua. See [Tables](#tables) for more information.

Lua provides automatic conversion between __string__ and __number__ values at run time. Any arithmetic operation applied to a string tries to convert this string to a number, following the usual conversion rules. Conversely, whenever a number is used where a string is expected, the number is converted to a string, in a reasonable format. For complete control over how numbers are converted to strings, use the [string.format][api.library.string.format] function from the string library.




<a id="tables"></a>

## Tables

Tables are the sole data structuring mechanism in Lua. They implement __associative&nbsp;arrays__, meaning that arrays can be indexed not only with numbers, but with any value except `nil`. Tables can be heterogeneous and they can contain values of all types except `nil`.

To represent records (properties), Lua uses the field name as an __index__. The language supports this representation by providing `a.name` as syntactic sugar for `a["name"]`.

Like indices, the value of a table field can be of any type except `nil`. In particular, because functions are <nobr>first-class</nobr> values, table fields can contain functions. Thus tables can also carry __methods__.

Tables are __objects__: variables do not actually contain these values, only __references__ to them. Assignment, parameter passing, and function returns always manipulate references to such values; these operations do __not__ imply any kind of copy.

The table constructor is written using __braces__ (curly&nbsp;brackets) as in `{}`.

``````lua
t = {}           -- Create a table

k = "x"
t[k] = 3.14      -- New table entry with key = "x" and value = 3.14

print( t[k] )    --> 3.14
print( t["x"] )  --> 3.14
print( t.x )     --> 3.14

t[2] = "foo"     -- New table entry with key = 2 and value = "foo"

print( t[2] )    --> "foo"
``````

<div class="guide-notebox">
<div class="notebox-title">Accessing Entries</div>

In the above example, the entry with field name `"x"` was accessed in two ways: as a __property__ using the dot operator `t.x` and as an __array&nbsp;index__ using `t["x"]`.

A common mistake is to confuse `t.x` with `t[x]`. The first is equivalent to `t["x"]`: a table indexed by the string `"x"`. The second is a table indexed by the value of variable `x`.

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Many Corona APIs return objects. You can manipulate the documented properties of these objects just like you would for table properties. You can even add your own properties provided you do __not__ prefix any of your custom properties with an underscore, as in <nobr>`t._custom = 10`</nobr>. Corona reserves the right to use any property name that begins with an underscore.

</div>




<a id="variables"></a>

## Variables

Variables are places that store values. There are three kinds of variables in Lua: __global__, __local__, and __table&nbsp;fields__ (properties). Any <nobr>non-initialized</nobr> variable is `nil` by default.

### Global

Global variables do not need declarations. You simply assign a value to one to create it:

``````lua
print( s )  --> nil

s = "One million dollars"

print( s )  --> One million dollars
``````

Global variables live as long as your application is running. You can delete a global variable by assigning `nil` to it. At this point, the global variable behaves as if it were never initialized.

``````lua
s = nil
print( s )  --> nil
``````

### Local

Local variables are declared using the local statement:

``````lua
x = 1         -- Global variable
local y = 10  -- Local variable
``````

Unlike global variables, local variables are visible only in the block where they are declared. The __scope__ of the local variable begins after the declaration and ends at the end of the block.

``````lua
a = 10
local i = 1

while ( i <= 10 ) do
	local a = i*i  -- Different variable "a", local to this "while" block
	print( a )     --> 1, 4, 9, 16, 25, ...
	i = i + 1
end
 
print( a )         --> 10 (the global "a")
``````

### Table Fields

Table fields are just the elements of the table themselves. You index into the array to assign the values to a field.

``````lua
t = { foo="hello" }  -- Create table with a single property "foo"
print( t.foo )       --> "hello"

t.foo = "bye"        -- Assign a new value to property "foo"
print( t.foo )       --> "bye"

t.bar = 10           -- Create a new property named "bar"
print( t.bar )       --> 10
print( t["bar"] )    --> 10
``````




<a id="expressions"></a>

## Expressions

### Arithmetic Operators

Lua supports the usual binary arithmetic operators:

<div class="inner-table">

Operator	Purpose
----------	----------------
`+`			addition
`-`			subtraction
`*`			multiplication
`/`			division
`%`			modulo
`^`			exponentiation
----------	----------------

</div>

It also supports the unary `-` (negation).

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* If the operands are numbers or strings that can be converted to numbers, all operations have the usual meaning. Exponentiation works for any exponent. For instance, `x^(-0.5)` computes the inverse of the square root of `x`.

* Modulo is defined as: <nobr>`a % b == a - math.floor(a/b)*b`</nobr>, as in the remainder of a division that rounds the quotient towards minus infinity.

</div>

### Relational Operators

The relational operators in Lua are:

<div class="inner-table">

Operator	Purpose
----------	----------------
`==`		equal to
`~=`		not equal to
`<`			less than
`>`			greater than
`<=`		less than or equal to
`>=`		greater than or equal to
----------	----------------

</div>

These operators always result in `true` or `false`.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* Equality (`==`) first compares the [type][api.library.global.type] of its operands. If the types are different, then the result is `false`. Otherwise, the values of the operands are compared.

* Numbers and strings are compared in the usual way. Objects are compared by reference: two objects are considered equal only if they are the same object. Every time you create a new object, this object is different from any previously existing object.

* The automatic conversion rules do __not__ apply to equality comparisons. Thus, <nobr>`"0" == 0`</nobr> evaluates to `false`.

</div>

### Logical Operators

The logical operators in Lua are `and`, `or`, and `not`. All logical operators consider both `false` and `nil` as false and anything else as true.

* __and__ — the conjunction operator `and` returns its first argument if this value is `false` or `nil`; otherwise, `and` returns its second argument.

* __or__ — the disjunction operator `or` returns its first argument if this value is different from `nil` and `false`; otherwise, `or` returns its second argument.

* __not__ — the negation operator `not` always returns `false` or `true`.

Both `and` and `or` use shortcut evaluation &mdash; the second operand is evaluated only if necessary.

``````lua
10 or 20           --> 10
10 or error()      --> 10
nil or "a"         --> "a"
nil and 10         --> nil
false and error()  --> false
false and nil      --> false
false or nil       --> nil
10 and 20          --> 20
``````

### Concatenation

The string concatenation operator in Lua is denoted by two dots (`..`). If both operands are strings or numbers, then they are converted to strings according to the conversion rules mentioned above.

``````lua
local s = "foo".."10"
``````

### Length Operator

The length operator is denoted by the unary operator `#`. The length of a __string__ is its number of bytes&nbsp;— the usual meaning of string length when each character is one byte.

The length of a __table__ `t` is defined to be any integer index `n` such that `t[n]` is not `nil` and `t[n+1]` is `nil`; moreover, if `t[1]` is `nil`, `n` can be zero. For a regular array, with <nobr>non-`nil`</nobr> values from 1 to a given `n`, its length is exactly that `n`, the index of its last value. If the array has "holes" <nobr>(`nil` values</nobr> between other <nobr>non-`nil` values)</nobr>, then `#t` can be any of the indices that directly precedes a `nil` value. Thus, it may consider any such `nil` value as the end of the array.

### Precedence

Operator precedence in Lua follows the list below, from lower to higher priority:

* `or`
* `and`
* `<`, `>`, `<=`, `>=`, `~=`, `==`
* `..`
* `+`, `-`
* `*`, `/`, `%`
* `not`, `#`, `-` (unary)
* `^`

As usual, you can use parentheses to change the precedences of an expression. The concatenation (`..`) and exponentiation (`^`) operators are right associative. All other binary operators are left associative.




<a id="functions"></a>

## Functions

Plain functions are just as expected: you provide arguments as input <nobr>(within the parentheses)</nobr>, the function performs some tasks, and the results can be returned.

The following are common methods to declare a function:

``````lua
local function f ()
--body
end

local f = function()
--body
end

function f ()
--body
end

f = function ()
--body
end
``````

Functions can be variables, so a table can store them as properties. This allows for very flexible uses of a table. It can be used to logically group a family of functions into a table, for example the `math` library. In this case, to calculate the sine of 100, you would write `math.sin(100)`. Here, `math` is merely a table, and the property `sin` is the actual function.

### Object Method

Objects in Lua are represented by tables. Display objects and the global Runtime object are all __objects__. Like the `math` library, these objects similarly store object methods (instance&nbsp;methods) as properties. One key difference, however, is syntax. You need to tell Lua that you intend this function to be called as an __object&nbsp;method__, not just a plain function. To do so, you need to use the colon (`:`) operator instead of the dot operator. This may be different from other languages. Compare the syntax of Javascript and Lua:

<div class="inner-table">

Javascript								Lua
--------------------------------------	--------------------------------------
`object.translate( 10, 10 );`&nbsp;		`object:translate( 10, 10 )`&nbsp;
--------------------------------------	--------------------------------------

</div>




<a id="scope"></a>

## Scope Rules

Lua is a lexically scoped language. The scope of variables begins at the first statement after their declaration and lasts until the end of the innermost block that includes the declaration.

``````lua
x = 10					-- Global variable
do						-- New block
	local x = x			-- New "x" with value 10
	print(x)			--> 10
	x = x+1
	do					-- Another block
		local x = x+1	-- Another "x"
		print(x)		--> 12
	end
	print(x)			--> 11
end
print(x)				--> 10  (the global one)
``````

Notice that, in a declaration like <nobr>`local x = x`</nobr>, the new `x` being declared is not in scope yet, and so the second `x` refers to the outside variable.

Because of the lexical scoping rules, local variables can be freely accessed by functions defined inside their scope. A local variable used by an inner function is called an __upvalue__, or external local variable, inside the inner function.

Notice that each execution of a `local` statement defines new local variables:

``````lua
a = {}
local x = 20
for i = 1, 10 do
	local y = 0
	a[i] = function () y = y+1; return x+y end
end
``````

The loop creates ten closures (ten&nbsp;instances of the anonymous&nbsp;function). Each of these closures uses a different `y` variable, while all of them share the same `x`.




<a id="memory"></a>

## Memory Allocation

Mobile devices in particular have limited memory available for use, so care must be taken to ensure that the total memory footprint of your application is kept to a minimum.

Lua performs automatic memory management. This means that you don't have to worry about allocating memory for new objects. Nor do you need to explicitly free memory when the objects are no longer needed. Lua manages memory automatically by running a __garbage&nbsp;collector__ from time to time to collect all "dead" objects (objects&nbsp;that are no longer accessible from&nbsp;Lua). All memory used by Lua is subject to automatic management. However, it is up to you to tell Lua what to consider garbage. For example, anything stored in a global variable is __not__ considered garbage, even if your application never uses it again. Similarly, anything stored in a table or array will not be considered garbage if that table/array cannot be removed by the garbage collector, even if the stored variable/object was initially declared in the local scope. In both cases, it is up to you to assign `nil` to these positions. This ensures that their corresponding memory will not be locked and can be freed by the garbage collector.

Display object require an additional step. You must first remove the object from the display hierarchy using `object:removeSelf()` or <nobr>`display.remove( object )`</nobr>, then you must set its reference to `nil`.

``````lua
myObject:removeSelf()
-- OR...
display.remove( myObject )

myObject = nil
``````




<a id="syntax"></a>

## Syntax Comparison

Some differences in syntax between Lua and other languages are worth noting because they can help prevent compiler errors:

* __semicolons__ — trailing semicolon at the end of each statement (effectively a line of&nbsp;code) are __optional__ in Lua.

* __braces__ — You may be accustomed to using <nobr>`{ }`</nobr> to define variable scope. In Lua, you do this by bracketing the code with `do` and `end`. Braces in Lua are interpreted as __table&nbsp;constructors__.

* __if - then - else__ — if you come from C, Java, Javascript, etc., a common mistake you'll make in writing `if` and `elseif` statements is forgetting to append `then` to the end of the `if/elseif` test conditions. Another common mistake is inadvertently using `else if` (with&nbsp;a&nbsp;space) when Lua expects `elseif`.

* __arrays__ — in Lua, arrays are __1-based__. Technically, you can index into an array starting with `0`. However, Lua and Corona APIs assume that the first element of a table `t` is `t[1]`, not `t[0]`.

* __multiple return values__ — an unconventional but useful feature in Lua is the ability of a function to return __more than&nbsp;one&nbsp;result__.

* __multiple assignment__ — multiple assignments offer a convenient way to swap values. The statement <nobr>`x,y = y,x`</nobr> will swap `x` for `y` and vice versa.

* __ternary operator__ (`? :`) — Lua does not offer the equivalent to the C ternary operator `a?b:c`. The Lua idiom <nobr>`(a and b) or c`</nobr> offers a close approximation provided `b` is not false. For example, the Lua equivalent to <nobr>`max = (x>y?x:y)`</nobr> would be <nobr>`max = ( x>y and x or y)`</nobr>.




<a id="luafunctions"></a>

## Lua Functions

The basic Lua library provides several core functions. For security reasons, the `dofile()`, `load()`, and `loadfile()` functions are not available in Corona. `loadstring()` is supported.

See the [(globals)][api.library.global] API reference for the complete list available to you.

<br />
<div class="newline" style="margin-top:10px; margin-bottom:18px;"></div>

Content in this guide is cited from the [Lua 5.1 Reference Manual](http://www.lua.org/manual/5.1/), freely available under the terms of the [Lua license](http://www.lua.org/license.html).
