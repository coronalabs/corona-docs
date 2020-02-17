# setmetatable()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table, metatable
> __See also__          [getmetatable()][api.library.global.getmetatable]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the metatable for the given table (you cannot change the metatable of other types from Lua, only from C). If `metatable` is `nil`, removes the metatable of the given table. If the original metatable has a `__metatable` field, it raises an error.

This function returns the same table that was provided as the first argument of the function, now with its metatable set.

## Syntax

	setmetatable( table, metatable )

##### table ~^(required)^~
_[Table][api.type.Table]._ The Lua table whose metatable you want to modify.

##### metatable ~^(required)^~
_[Table][api.type.Table]._ The Lua table to set as the new metatable for `table`.


## Example

`````lua
local t = {}
local mt = { __index = t }

function t.new()
	return setmetatable( {}, mt )
end

return t
`````