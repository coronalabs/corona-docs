# object.particleGravityScale

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          particleGravityScale, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This numerical property controls the scaling of gravity. This value is `1.0` by default.


## Example

``````lua
local particleSystem = physics.newParticleSystem(
	{
		filename = "particle.png",
		radius = 2
	}
)

particleSystem.particleGravityScale = 1.0
``````
