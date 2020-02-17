# object.particleRadius

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          particleRadius, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
>								[object.imageRadius][api.type.ParticleSystem.imageRadius]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This numerical property controls the radius of particles. This value is `1.0` by default.


## Gotchas

If you change the radius during execution, existing particles may explode, shrink, or behave unexpectedly.


## Example

``````lua
local particleSystem = physics.newParticleSystem(
	{
		filename = "particle.png",
		radius = 2
	}
)

particleSystem.particleRadius = 3.0
``````