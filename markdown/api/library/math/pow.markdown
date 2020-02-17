# math.pow()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          pow, power, exponent
> __See also__          [math.exp()][api.library.math.exp]<br/>[math.log()][api.library.math.log]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns `x^y^`. (You can also use the expression `x^y` to compute this value.)

## Syntax

	math.pow( x, y )

##### x ~^(required)^~
_[Number][api.type.Number]._ The base.

##### y ~^(required)^~
_[Number][api.type.Number]._ The exponent.

## Examples

``````lua
print(math.pow(100,0))  ---->  1
print(math.pow(7,2))    ---->  49
print(math.pow(2,8))    ---->  256
``````
