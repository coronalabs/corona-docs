# table.indexOf()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [table.*][api.library.table]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table, array
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the integer index of an element within an array, or `nil` if the element is not in the array. The search goes through the length of the array as determined by `#t` whose value is undefined if there are holes.

## Gotchas

This function can not be used to locate a child table/array within the array being searched.

## Syntax

	table.indexOf( t, element )

##### t ~^(required)^~
_[Array][api.type.Array]._ The array to be searched.

##### element ~^(required)^~
_[String][api.type.String] or [Number][api.type.Number]._ The element to search for within array `t`.


## Example

``````lua
local t = { 1, 3, 5, 7, 9, "a", "b" }
print( table.indexOf( t, 9 ) )    --> 5
print( table.indexOf( t, 3 ) )    --> 2
print( table.indexOf( t, "b" ) )  --> 7
``````
