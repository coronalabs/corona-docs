# object.particleStrictContactCheck

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          particleStrictContactCheck, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This boolean property controls the strict particle/body contact check. This value is `false` by default.


## Example

``````lua
local particleSystem = physics.newParticleSystem(
	{
		filename = "particle.png",
		radius = 2
	}
)

particleSystem.particleStrictContactCheck = false
``````
