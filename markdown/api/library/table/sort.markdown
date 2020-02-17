# table.sort()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [table.*][api.library.table]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table, array
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sorts table elements in a given order, in-place, from `table[1]` to `table[n]`, where `n` is the length of the table. It receives the table (array) to be sorted plus an optional `compare` function. This `compare` function receives two arguments and must return `true` if the first argument should come first in the sorted array. If `compare` is __not__ given, then the standard Lua operator `<` is used instead.

The sort algorithm is not entirely stable; that is, elements considered equal by the given order may have their relative positions changed by the sort.

## Syntax

	table.sort( array [, compare] )

##### array ~^(required)^~
_[Array][api.type.Array]._ The array to sort.

##### compare ~^(optional)^~
_[Function][api.type.Function]._ If not given, the standard Lua operator `<` is used.


## Examples

##### Low-to-High

``````lua
local t = { 3,2,5,1,4 }

local function compare( a, b )
	return a < b  -- Note "<" as the operator
end

table.sort( t, compare )
print( table.concat( t, ", " ) )  --> 1, 2, 3, 4, 5
``````

##### High-to-Low

``````lua
local t = { 3,2,5,1,4 }

local function compare( a, b )
	return a > b  -- Note ">" as the operator
end

table.sort( t, compare )
print( table.concat( t, ", " ) )  --> 5, 4, 3, 2, 1
``````

##### Alphabetical (Child Tables)

``````lua
local fruitList = {
	{ fruitName="apple", fruitColor="red" },
	{ fruitName="watermelon", fruitColor="green" },
	{ fruitName="orange", fruitColor="orange" },
	{ fruitName="lemon", fruitColor="yellow" }
}

local function compare( a, b )
	return a.fruitName < b.fruitName
end

table.sort( fruitList, compare )

for i,v in ipairs( fruitList ) do
	print( i, v.fruitName )
	--> 1	apple
	--> 2	lemon
	--> 3	orange
	--> 4	watermelon
end
``````
