# math.deg()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          deg, degree
> __See also__          [math.rad()][api.library.math.rad]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Convert a value from radians to degrees.

## Syntax

	math.deg( x )

##### x ~^(required)^~
_[Number][api.type.Number]._ An angle in radians.


## Examples

``````lua
print(math.deg(math.pi))        ---> 180
print(math.deg(math.pi / 2))    ---> 90
print(math.rad(180))            ---> 3.1415926535898
``````
