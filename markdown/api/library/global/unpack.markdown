
# unpack()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      (elements of given table between `i` and `j`)
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          unpack, global
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the elements from the given table. This function is equivalent to the following:

    return list[i], list[i+1], ..., list[j]

The difference is that the above code can be written only for a fixed number of elements. By default, `i` is `1` and `j` is the length of the list, as defined by the length operator (`#`).

## Syntax

	unpack( list [, i [, j ]] )

##### list ~^(required)^~
_[Table][api.type.Table]._ The table whose elements will be unpacked.

##### i ~^(optional)^~
_[Number][api.type.Number]._ The index of the table element at which the function will begin unpacking values. Default is `1`.

##### j ~^(optional)^~
_[Number][api.type.Number]._ The index of the table element at which the function will stop unpacking values. Default is the length of the given table provided by the length operator (`#`).


## Example

`````lua
local t = 
{
    [1] = "first",
    [2] = "second",
    [3] = "third",
    [4] = "fourth",
    [5] = "fifth"
}

local two, three, four = unpack( t, 2, 4 )

print( two, three, four )

-- OUTPUT: second  third  fourth
``````
