# object:applyForce()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          applyForce, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
>								[object:applyLinearImpulse()][api.type.ParticleSystem.applyLinearImpulse]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

A function that accepts __x__ and __y__ components of a linear force in newtons, applied to the center of each particle in a [ParticleSystem][api.type.ParticleSystem].

## Syntax

	particleSystem:applyForce( xForce, yForce )

##### xForce, yForce ~^(required)^~
_[Numbers][api.type.Number]._ Amount of force to apply in the __x__ and __y__ directions respectively.

## Example

``````lua
particleSystem:applyForce( 0, -9.8 * particleSystem.particleMass )
``````
