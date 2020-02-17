# object.particlePaused

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          particlePaused, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This boolean property controls pausing of the simulation of particles. This value is `false` by default, meaning that the simulation should be executed as normal.


## Example

``````lua
local particleSystem = physics.newParticleSystem(
	{
		filename = "particle.png",
		radius = 2
	}
)

particleSystem.particlePaused = false
``````
