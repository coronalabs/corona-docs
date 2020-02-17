
# physics.getMKS()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          MKS units, physics
> __See also__          [physics.setMKS()][api.library.physics.setMKS]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Get the MKS value of the physics simulation for specific keys.

## Syntax

	physics.getMKS( key )

##### key ~^(required)^~
_[String][api.type.String]._ The key to get MKS units of. Can be any one of the following values:

* `"velocityThreshold"` — corresponds to `b2_velocityThreshold`.
* `"timeToSleep"` — corresponds to `b2_timeToSleep`.
* `"linearSleepTolerance"` — corresponds to `b2_linearSleepTolerance`.
* `"angularSleepTolerance"` — corresponds to `b2_angularSleepTolerance`.


## Example

`````lua
local vt_mks = physics.getMKS( "velocityThreshold" )
`````
