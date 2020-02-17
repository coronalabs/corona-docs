
# physics.setVelocityIterations()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, velocity, accuracy, calculations
> __See also__          [physics.start()][api.library.physics.start]
>						[physics.setPositionIterations()][api.library.physics.setPositionIterations]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the accuracy of the engine's velocity calculations. The default value is `8`.

## Syntax

	physics.setVelocityIterations( value )

##### value ~^(required)^~
_[Number][api.type.Number]._ The number of iterations. The default value is `8`, which means that the engine will iterate through eight velocity approximations per frame for each object. Increasing this number will cause fewer momentary inaccuracies like overlapping objects, but it will increase computational overhead. The default value should work for most general cases.


## Example

`````lua
physics.setVelocityIterations( 16 )
`````
