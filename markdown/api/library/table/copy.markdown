# table.copy()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [table.*][api.library.table]
> __Return value__      [Array][api.type.Array]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table, array
> __See also__          [table.concat()][api.library.table.concat]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a shallow copy of array, i.e. the portion of the array (table) with integer keys. A variable number of additional arrays can be passed in as optional arguments. If an array has a hole (a `nil` entry), copying in a given source array stops at the last consecutive item prior to the hole.

In Lua, the function `table.concat()` is equivalent to JavaScript's `array.join()`. Hence, the following function is called `copy()`.

## Syntax

	table.copy( t )

	table.copy( t, ... )

##### t ~^(required)^~
_[Array][api.type.Array]._ An array of elements.

Additional arrays can optionally be passed.

## Example

``````lua
local t1 = {1,3,5,7,9}
local t2 = {2,4,6,333}
t2[6] = 555 -- create hole
local t3 = {11,13,17,19}
 
local c = table.copy( t1, t2, t3 )

-- output: 1, 3, 5, 7, 9, 2, 4, 6, 333, 11, 13, 17, 19
print( table.concat( c, ", " ) ) 
``````
