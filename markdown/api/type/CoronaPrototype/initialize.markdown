# object:initialize()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [CoronaPrototype][api.type.CoronaPrototype]
> __Library__           none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Subclasses can override this method to provide custom initialization of instances.

## Syntax

	object:initialize()

## Example

``````lua
local Prototype = require( "CoronaPrototype" )

local MyClass = Prototype:newClass( "MyClass" )

function MyClass:initialize()
	-- custom init
	self.foo = "bar"
	return self
end

local instance = MyClass:new()
print( instance.foo )
``````

