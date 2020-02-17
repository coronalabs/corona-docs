# math.acos()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          acos, arc cosine
> __See also__          [math.cos()][api.library.math.cos]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the arc cosine of `x` in radians. The result will be in the range `0` to `pi`. If the parameter `x` is outside the range `[-1..1]`, the result will be `NaN`.

## Syntax

	math.acos( x )

##### x ~^(required)^~
_[Number][api.type.Number]._ A number.


## Examples

``````lua
local x = math.acos(1)    -- result will be 0
local y = math.acos(-1)    -- result will be 3.14159...
local z = math.acos(1.1)   -- result will be NaN
``````
