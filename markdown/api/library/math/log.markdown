# math.log()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          log, logarithm
> __See also__          [math.exp()][api.library.math.exp]<br/>[math.pow()][api.library.math.pow]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the natural logarithm of `x`.

## Syntax

	math.log( x )

##### x ~^(required)^~
_[Number][api.type.Number]._ A number.


## Examples

``````lua
print(math.log (2.718281828459))     ----> very close to 1
print(math.log (1))     ----> 0
print(math.log (0))     ----> -inf
print(math.log (-1))    ----> NaN
``````
