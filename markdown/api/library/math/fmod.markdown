# math.fmod()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          fmod
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the remainder of the division of `x` by `y` that rounds the quotient towards zero.

The remainder of a division operation is the result of subtracting the integral quotient multiplied by the denominator from the numerator:

`remainder = numerator - quotient * denominator`

## Syntax

	math.fmod( x, y )

##### x ~^(required)^~
_[Number][api.type.Number]._ The numerator of the quotient.

##### y ~^(required)^~
_[Number][api.type.Number]._ The denominator of the quotient.


## Examples

``````lua
print(math.fmod(5.3, 2))     ---> 1.3
print(math.fmod(1, 0))    ---> NaN
``````
