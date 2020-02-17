# table.concat()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [table.*][api.library.table]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table, array
> __See also__          [table.insert()][api.library.table.insert]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Concatenate the elements of a table together to form a string. Each element must be able to be coerced into a string. A separator can be specified which is placed between concatenated elements.

## Syntax

	table.concat( t )

	table.concat( t, sep )

	table.concat( t, sep, i )

	table.concat( t, sep, i, j )

##### t ~^(required)^~
_[Array][api.type.Array]._ An array where all elements are strings or numbers.

##### sep ~^(optional)^~
_[String][api.type.String]._ The string to insert between concatenated table values. The default value is the empty string.

##### i ~^(optional)^~
_[Number][api.type.Number]._ . The beginning table index to be concatenated. The default value is 1.

##### j ~^(optional)^~
_[Number][api.type.Number]._ . The ending table index to be concatenated. The default value is the length of the array `t`. If i is greater than j, returns the empty string.


## Example

``````lua
local t = { 1, 2, "three", 4, "five" }
print( table.concat(t) )              --> 12three4five
print( table.concat(t, ", ") )        --> 1, 2, three, 4, five
print( table.concat(t, ", ", 2, 4) )  --> 2, three, 4
``````

