# object.particleDensity

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          particleDensity, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
>						[object.particleRadius][api.type.ParticleSystem.particleRadius]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This numerical property controls the density of particles. This value is `1.0` by default.


## Example

``````lua
local particleSystem = physics.newParticleSystem(
    {
        filename = "particle.png",
        radius = 3
    }
)

particleSystem.particleDensity = 0.5
``````