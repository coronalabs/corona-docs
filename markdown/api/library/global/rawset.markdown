# rawset()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          rawset, rawget, tables
> __See also__          [rawget()][api.library.global.rawget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the real value of `table[index]` to `value` without invoking any metamethod. `table` must be a table, `index` any value different from `nil`, and `value` any Lua value.

## Syntax

	rawset( table, index, value )

##### table ~^(required)^~
_[Table][api.type.Table]._ Table to modify.

##### index ~^(required)^~
_[Number][api.type.Number] or [String][api.type.String]._ Index into table.

##### value ~^(required)^~
The value to be written to `table[index]`.