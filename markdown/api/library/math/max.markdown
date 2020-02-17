# math.max()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          max, maximum
> __See also__          [math.min()][api.library.math.min]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the maximum value among its arguments.

## Syntax

	math.max( x, ... )

##### x ~^(required)^~
_[Number][api.type.Number]._ A number.


## Examples

``````lua
print(math.max(1.2, -7, 3))        --->3
print(math.max(0, -100000000))     --->0
print(math.max(0, 1/0, math.huge)) --->inf
``````