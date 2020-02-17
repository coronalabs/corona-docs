# object.particleMass

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          particleMass, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
>								[object.particleDensity][api.type.ParticleSystem.particleDensity]
>								[object.particleRadius][api.type.ParticleSystem.particleRadius]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Read-only numerical property representing the mass of a single particle, in kilograms, within a [ParticleSystem][api.type.ParticleSystem].

## Example

``````lua
particleSystem:applyForce( 0, -9.8 * particleSystem.particleMass )
``````
