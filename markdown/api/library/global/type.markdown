# type()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          type, datatype
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the type of its argument. Possible results are:

* `"nil"` (a string, not a `nil` value)
* `"number"`
* `"string"`
* `"boolean"`
* `"table"`
* `"function"`
* `"thread"`
* `"userdata"`

## Syntax

	type( v )

##### v ~^(required)^~
The item whose type is to be determined.

## Example

`````lua
local t = {}
local n = 123
local s = "Hello world!"
local b = true
local function f() return "this is a string"; end

local type_t = type( t )     -- "table"
local type_n = type( n )     -- "number"
local type_s = type( s )     -- "string"
local type_b = type( b )     -- "boolean"
local type_f1 = type( f )    -- "function"
local type_f2 = type( f() )	 -- "string"
`````