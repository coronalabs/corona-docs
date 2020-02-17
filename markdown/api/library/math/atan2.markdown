# math.atan2()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          atan2, arc tangent
> __See also__          [math.atan()][api.library.math.atan]<br/>[math.tan()][api.library.math.tan]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the arc tangent of `y/x` (in radians), but uses the signs of both parameters to find the quadrant of the result. It also correctly handles the case of `x` being `0`.

The result will be in the interval `[-pi,+pi]` radians.

This function is useful when converting rectangular coordinates to polar coordinates. `math.atan2()` uses the sign of both arguments to place the result into the correct quadrant, and also produces correct values when one of its arguments is `0` or very close to `0`.

## Syntax

	math.atan2( y, x )

##### y ~^(required)^~
_[Number][api.type.Number]._ A number representing the __y__ coordinate.

##### x ~^(required)^~
_[Number][api.type.Number]._ A number representing the __x__ coordinate.


## Examples

``````lua
print(math.atan2(1, 0))     -->  pi/2
print(math.atan2(-1, 0))    -->  -pi/2
print(math.atan2(0, 1))     -->  0
print(math.atan2(0, -1))    -->  pi
``````
