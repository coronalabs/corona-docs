# math.inf

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [math.*][api.library.math]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          math, inf
> __See also__          [math.huge][api.library.math.huge]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a value larger than or equal to any other numerical value.

## Syntax

	math.inf

## Examples

``````lua
print (1/0)                   ---> inf
print (math.huge)             ---> inf
print (math.huge / 2)         ---> inf
print ( -math.huge)           ---> -inf
print (math.huge/math.huge)   ---> nan
print (math.huge * 0)         ---> nan
``````
