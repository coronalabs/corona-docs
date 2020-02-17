# object:applyLinearImpulse()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          applyLinearImpulse, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
>								[object:applyForce()][api.type.ParticleSystem.applyForce]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Similar to [object:applyForce()][api.type.ParticleSystem.applyForce] except that an impulse is a single momentary jolt in <nobr>newton-seconds.</nobr>

## Syntax

	particleSystem:applyLinearImpulse( xForce, yForce )

##### xForce, yForce ~^(required)^~
_[Numbers][api.type.Number]._ Amount of impulse force to apply in the __x__ and __y__ directions respectively.

## Example

``````lua
particleSystem:applyLinearImpulse( 0, -9.8 * particleSystem.particleMass )
``````