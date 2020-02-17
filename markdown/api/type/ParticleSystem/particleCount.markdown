# object.particleCount

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          particleCount, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This read-only numerical property represents the number of particles alive.


## Example

``````lua
local particleSystem = physics.newParticleSystem(
	{
		filename = "particle.png",
		radius = 2
	}
)

print( particleSystem.particleCount )
``````
