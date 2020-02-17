# next()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      (varies)
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          pairs, ipairs, loops, iteration, table, array
> __See also__          [pairs()][api.library.global.pairs]
>								[ipairs()][api.library.global.ipairs]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Allows a program to traverse all fields of an [Array][api.type.Array]. `next()` returns the next index of the array and its associated value. When called with `nil` as its second argument, `next()` returns an initial index and its associated value. When called with the last index, or with `nil` in an empty array, `next()` returns `nil`. If the second argument is absent, then it is interpreted as `nil`. In particular, you can use `next(t)` to check whether an array is empty.

The order in which the indices are enumerated is not specified, even for numeric indices. To traverse an array in numeric order, use a numerical `for` loop or the [ipairs()][api.library.global.ipairs] function.

The behavior of `next()` is undefined if, during the traversal, you assign any value to a <nobr>non-existent</nobr> field in the array. You may, however, modify or clear existing fields.


## Syntax

	next( array [, index] )

##### array ~^(required)^~
_[Array][api.type.Array]._ The array that is being iterated.

##### index ~^(optional)^~
_[Number][api.type.Number]._ An index number of [Array][api.type.Array].


## Examples

`````lua
local tableWithoutIndexes = { 10, 20, 30, 40, 50 }

for key, value in next, tableWithoutIndexes, nil do
	print( "The key " .. key .. " has the value: " .. value )
end
`````

`````lua
-- Note that for tables containing indexes, next() will return the values in an arbitrary order

local tableWithIndexes = { first = 10, second = 20, third = 30, fourth = 40, fifth = 50 }

for key, value in next, tableWithIndexes, nil do
	print( "The key " .. key .. " has the value: " .. value )
end
`````
