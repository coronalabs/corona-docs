# object.imageRadius

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          imageRadius, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
>								[object.particleRadius][api.type.ParticleSystem.particleRadius]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This numerical property controls the radius of the particle image, in content units.


## Example

``````lua
local particleSystem = physics.newParticleSystem(
	{
		filename = "particle.png",
		radius = 2,
		imageRadius = 6
	}
)

particleSystem.imageRadius = 4
``````