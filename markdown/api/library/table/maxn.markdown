# table.maxn()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [table.*][api.library.table]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table, array
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the largest positive numerical index of the given table, or zero if the table has no positive numerical indices. To do its job, this function does a linear traversal of the whole table.

## Syntax

	table.maxn( t )

##### t ~^(required)^~
_[Array][api.type.Array]._ The array to traverse.


## Example

``````lua
local t = { 1,1,2,3,5,8,13 }
print( table.maxn(t) )   --> 7
``````
