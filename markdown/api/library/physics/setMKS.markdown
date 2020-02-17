
# physics.setMKS()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          MKS units, physics
> __See also__          [physics.getMKS()][api.library.physics.getMKS]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the MKS (meters, kilograms, and seconds) value of the physics simulation for specific keys. This is strictly for advanced purposes — the average developer and project will not require this function.

## Syntax

	physics.setMKS( key, value )

##### key ~^(required)^~
_[String][api.type.String]._ The key to set MKS units for. Can be any one of the following values:

* `"velocityThreshold"` — corresponds to `b2_velocityThreshold`.
* `"timeToSleep"` — corresponds to `b2_timeToSleep`.
* `"linearSleepTolerance"` — corresponds to `b2_linearSleepTolerance`.
* `"angularSleepTolerance"` — corresponds to `b2_angularSleepTolerance`.

##### value ~^(required)^~
_[Number][api.type.Number]._ The value of for the chosen MKS key.


## Example

``````lua
physics.setMKS( "timeToSleep", 10 )
``````