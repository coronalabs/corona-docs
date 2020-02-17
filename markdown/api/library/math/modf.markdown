# math.modf()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          modf
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns two numbers, the integral part of `x` and the fractional part of `x`.

For the modulus (remainder), use the modulo operator `%` instead.

## Syntax

	math.modf( x )

##### x ~^(required)^~
_[Number][api.type.Number]._ A number.


## Examples

``````lua
print( math.modf(5) )     ---->  5       0
print( math.modf(5.3) )   ---->  5       0.3
print( math.modf(-5.3) )  ----> -5      -0.3
``````

``````lua
local myNumber = 4.75
local integralPart, fractionalPart = math.modf( myNumber )
print( "Integral Part:", integralPart )
print( "Fractional Part:", fractionalPart )
``````