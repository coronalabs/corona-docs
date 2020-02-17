# math.ceil()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ceil, ceiling
> __See also__          [math.floor()][api.library.math.floor]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the integer larger than or equal to `x`.

## Syntax

	math.ceil( x )

##### x ~^(required)^~
_[Number][api.type.Number]._ A number.


## Examples

``````lua
print( math.ceil(0.5) )     ---> 1
print( math.ceil(-0.5) )    ---> -0
``````
