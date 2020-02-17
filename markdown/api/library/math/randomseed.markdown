# math.randomseed()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          randomseed
> __See also__          [math.random()][api.library.math.random]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the "seed" for the pseudo-random number generator. The same seed will produce the same sequence of random numbers each time and can be useful for testing but it is generally more desirable to have a different sequence for each run by using something like the current time as the seed (see&nbsp;below).


## Syntax

	math.randomseed( seed )

##### seed ~^(required)^~
_[Number][api.type.Number]._ A number.


## Examples

##### Variable Seed

``````lua
-- Produces a different sequence each time (assuming enough time between invocations)
math.randomseed( os.time() )
``````

##### Constant Seed

``````lua
-- Produces the same sequence of numbers
math.randomseed( 1234 )
print ( math.random(), math.random(), math.random() )  --> 0.31763056866714   0.416967588671   0.97426279353642
math.randomseed( 1234 )
print ( math.random(), math.random(), math.random() )  --> 0.31763056866714   0.416967588671   0.97426279353642
``````
