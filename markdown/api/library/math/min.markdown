# math.min()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          min, minimum
> __See also__          [math.max()][api.library.math.max]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Return the minimum value among its arguments.

## Syntax

	math.min( x, ... )

##### x ~^(required)^~
_[Number][api.type.Number]._ A number.


## Examples

``````lua
print(math.min(1.2, -7, 3))        ---> -7
print(math.min(0, 1e-9))           ---> 0
print(math.min(0, 1/0, math.huge)) ---> 0
``````
