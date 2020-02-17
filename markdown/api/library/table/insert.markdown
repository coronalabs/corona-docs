# table.insert()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [table.*][api.library.table]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table, array
> __See also__          [table.remove()][api.library.table.remove]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Inserts a given value into a table. If a position is given, inserts the value before the element currently at that position.

## Syntax

	table.insert( t, value )

	table.insert( t, pos, value )

##### t ~^(required)^~
_[Table][api.type.Table]._ A table to which the new value will be added. When a table has an element inserted both the size of the array and the element indices are updated.

##### pos ~^(optional)^~
_[Number][api.type.Number]._ The index of the table at which the new element will be inserted. The default value is the length of the table + 1 so that `table.insert(t,x)` inserts `x` at the end of table `t`. Note that it is faster to use the length operator: `t[#t + 1] = x`.

##### value ~^(required)^~
The new value to assign to be inserted into the table.


## Example

``````lua
local t = { 1, "three", 4, "five" }
print ( table.concat(t, ", ") )  --> 1, three, 4, five
table.insert( t, 2, "two" )  
print ( table.concat(t, ", ") )  --> 1, two, three, 4, five
``````