# math.ldexp()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ldexp
> __See also__          [math.frexp()][api.library.math.frexp]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns `m*2^e^` where `m` containts the significant binary digits and `e` is the exponent.

## Syntax

	math.ldexp( m, e )

##### m ~^(required)^~
_[Number][api.type.Number]._ The significand.

##### e ~^(required)^~
_[Number][api.type.Number]._ The exponent.


## Examples

``````lua
print( math.ldexp( 0.5, 8 ) )     ---> 128
``````