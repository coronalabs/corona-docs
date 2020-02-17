# math.asin()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          asin, arc sine
> __See also__          [math.sin()][api.library.math.sin]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the arc sine of a `x` (in radians). The result will be in the range `-pi/2` to `pi/2`. If the parameter `x` is outside the range `[-1..1]`, the result will be `NaN`.

## Syntax

	math.asin( x )

##### x ~^(required)^~
_[Number][api.type.Number]._ A number.


## Examples

``````lua
print (math.asin (1))     -- result will be 1.57079...
print (math.asin (-1))    -- result will be -1.57079...
print (math.asin (1.1))   -- result will be NaN
``````
