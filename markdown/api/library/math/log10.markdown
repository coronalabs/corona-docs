# math.log10()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          log10, base-10
> __See also__          [math.exp()][api.library.math.exp]<br/>[math.pow()][api.library.math.pow]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the base-10 logarithm of `x`.

## Syntax

	math.log10( x )

##### x ~^(required)^~
_[Number][api.type.Number]._ A number.


## Examples

``````lua
print(math.log10(10))    ----> 1
print(math.log10(1))     ----> 0
print(math.log10(0))     ----> -inf
print(math.log10(-1))    ----> nan
``````
