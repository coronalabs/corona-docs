# rawget()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      (varies)
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          rawget, rawset, tables
> __See also__          [rawset()][api.library.global.rawset]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Gets the real value of `table[index]`, without invoking any metamethod. `table` must be a [Table][api.type.Table]; `index` may be any [Number][api.type.Number] or [String][api.type.String].


## Syntax

	rawget( table, index )

##### table ~^(required)^~
_[Table][api.type.Table]._ Any table.

##### indexG2 ~^(required)^~
_[Number][api.type.Number] or [String][api.type.String]._ Index into table (that you want to "get" the real value of).


## Example

`````lua
local t = {
	sample = "example value",
	another = 12345
}

print( rawget( t, "sample" ) )

-- OUTPUT: "example value"
`````