# object.particleDamping

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          particleDamping, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This numerical property controls the damping of particles.


## Example

``````lua
local particleSystem = physics.newParticleSystem(
	{
		filename = "particle.png",
		radius = 2
	}
)

particleSystem.particleDamping = 1.0
``````
