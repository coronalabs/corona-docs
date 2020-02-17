# math.frexp()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          frexp, normalized fraction
> __See also__          [math.ldexp()][api.library.math.ldexp]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Splits `x` into a normalized fraction and an exponent.

Returns two numbers:

* `m` &mdash; a number that contains the significant (binary) digits and whose absolute value is in the range `[0.5, 1.0]` (or `0` when `x` is `0`)
* `e` &mdash; an integral exponent of `2`

Such that:

    x = m * 2^e^


## Syntax

	math.frexp( x )

##### x ~^(required)^~
_[Number][api.type.Number]._ A number.


## Examples

``````lua
print(math.frexp(2))    ---> 0.5     2
print(math.frexp(3))    ---> 0.75    2
print(math.frexp(128))  ---> 0.5     8
``````
