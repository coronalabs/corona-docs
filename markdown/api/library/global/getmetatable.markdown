# getmetatable()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          getmetatable, setmetatable, metatables, tables
> __See also__          [setmetatable()][api.library.global.setmetatable]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Gets the metatable of a specified [Table][api.type.Table]. If the table does not have a metatable, it returns `nil`. Otherwise, if the object's metatable has a `__metatable` field, it returns the associated value. Otherwise, it returns the metatable of the given table.


## Syntax

	getmetatable( object )

##### object ~^(required)^~
_[Table][api.type.Table]._ A table for which to get the metatable.


## Example

`````lua
local t = {}
t.name = "Joe"

local mt = {}
setmetatable( t, mt )

local another_t = {}
setmetatable( another_t, getmetatable(t) )
`````