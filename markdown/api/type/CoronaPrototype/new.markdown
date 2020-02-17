# object:new()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [CoronaClass][api.type.CoronaClass]
> __Library__           none
> __Return value__      [CoronaPrototype][api.type.CoronaPrototype]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Constructor for creating new object instances. The `object` is assumed to be a [class][api.type.CoronaClass] object.

## Syntax

	object:new()
	object:new( params )

##### params ~^(optional)^~
_[Table][api.type.Table]._ Optional table of parameters which can be passed to `new()` and forwarded to `initialize()` which can be overridden by subclasses.

## Example

``````lua
local Prototype = require( "CoronaPrototype" )

local paramsTable = { value = 3 }

local Foo = Prototype:newClass( "Foo" )
function Foo:initialize( params )
	print( params.value )
end

-- Pass params to initialize() which prints '3'
Foo:new( paramsTable )
``````