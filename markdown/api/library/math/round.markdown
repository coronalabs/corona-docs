# math.round()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          round
> __See also__          [math.ceil()][api.library.math.ceil]
>						[math.floor()][api.library.math.floor]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Rounds number to the nearest integer following the same rules as the JavaScript version, i.e. if the fractional portion of number is `0.5` or greater, the argument is rounded to the next higher integer. If the fractional portion of number is less than `0.5`, the argument is rounded to the next lower integer.

## Syntax

	math.round( x )

##### x ~^(required)^~
_[Number][api.type.Number]._ The number to round.


## Example

``````lua
print( math.round( 0.1 ) )   -- Output: 0
print( math.round( 0.5 ) )   -- Output: 1
print( math.round( 8.9 ) )   -- Output: 9 
print( math.round( -0.1 ) )  -- Output: 0
print( math.round( -0.5 ) )  -- Output: 0
print( math.round( -8.9 ) )  -- Output: -9
``````
