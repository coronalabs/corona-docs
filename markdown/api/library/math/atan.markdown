# math.atan()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          atan, arc tangent
> __See also__          [math.tan()][api.library.math.tan]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the arc tangent of a `x` in radians. The result will be in the range `-pi/2` to `pi/2`.

## Syntax

	math.atan( x )

##### x ~^(required)^~
_[Number][api.type.Number]._ A number.


## Examples

``````lua
print("atan(0) = " .. math.atan(0))              --- result is 0
print("atan(inf) = " .. math.atan(math.huge))    --- result is +pi/2
print("atan(-inf) = " .. math.atan(-math.huge))  --- result is -pi/2
``````
