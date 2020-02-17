# math.tan()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          tan, tangent
> __See also__          [math.atan()][api.library.math.atan]<br/>[math.atan2()][api.library.math.atan2]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the tangent of `x` (the angle in radians).

## Syntax

	math.tan( x )

##### x ~^(required)^~
_[Number][api.type.Number]._ The angle in radians.


## Examples

``````lua
print(math.tan(-math.pi/2))   ---> a very large negative number
print(math.tan(math.pi/4))    ---> 1
print(math.tan(math.pi/2))    ---> a very large number
``````
