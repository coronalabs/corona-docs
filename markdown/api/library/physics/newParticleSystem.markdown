
# physics.newParticleSystem()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [ParticleSystem][api.type.ParticleSystem]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          newParticleSystem, physics, particle, LiquidFun
> __See also__			[object:createParticle()][api.type.ParticleSystem.createParticle]
>						[object:createGroup()][api.type.ParticleSystem.createGroup]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

A [ParticleSystem][api.type.ParticleSystem] object contains particles with liquid-like behavior under the [LiquidFun](http://google.github.io/liquidfun/) framework.

Once you create a particle system, you can generate particles using [object:createParticle()][api.type.ParticleSystem.createParticle] or [object:createGroup()][api.type.ParticleSystem.createGroup].


## Gotchas

* Particles can only collide with other particles in the same particle system.

* To remove a particle system, use `particleSystem:removeSelf()` or `display.remove( particleSystem )`.

* This call cannot be used in a collision event. However, your collision handler may set a flag or include a time delay via [timer.performWithDelay()][api.library.timer.performWithDelay] so that the action can occur in the next application cycle or later. See the [Collision&nbsp;Detection][guide.physics.collisionDetection] guide for a complete list of which APIs and methods are subject to this rule.


## Syntax

	physics.newParticleSystem( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ A table that specifies the properties of the particle system — see the next section for valid entries.


## Parameter Reference

##### filename ~^(required)^~
_[String][api.type.String]._ The name of the texture file you want to use for each individual particle instance.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ By default, texture files are expected to be in the project folder (`system.ResourceDirectory`). If the texture file is in the [documents](api.library.system.DocumentsDirectory) directory, use `system.DocumentsDirectory`.

##### density ~^(optional)^~
_[Number][api.type.Number]._ This numerical property controls the density of particles. This value is `1.0` by default.

##### gravityScale ~^(optional)^~
_[Number][api.type.Number]._ This numerical property controls the scaling of gravity. This value is `1.0` by default.

##### radius ~^(optional)^~
_[Number][api.type.Number]._ The radius of the physical body for each generated particle.

##### imageRadius ~^(optional)^~
_[Number][api.type.Number]._ If defined, the particle image will be rendered at a different radius than the physical body. Otherwise, the image will be rendered at the value of `radius`.

##### maxCount ~^(optional)^~
_[Number][api.type.Number]._ This numerical property controls the maximum number of particles. This value is `0` by default, indicating no maximum limit.

##### pressureStrength ~^(optional)^~
_[Number][api.type.Number]._ Increases pressure in response to compression. Smaller values allow more compression.

##### dampingStrength ~^(optional)^~
_[Number][api.type.Number]._ Reduces velocity along the collision normal. Smaller value reduces less.

##### elasticStrength ~^(optional)^~
_[Number][api.type.Number]._ Restores shape of elastic particle groups. Larger values increase elastic particle velocity.

##### springStrength ~^(optional)^~
_[Number][api.type.Number]._ Restores length of spring particle groups. Larger values increase sprint particle velocity.

##### viscousStrength ~^(optional)^~
_[Number][api.type.Number]._ Reduces relative velocity of viscous particles. Larger values slow down viscous particles more.

##### surfaceTensionPressureStrength ~^(optional)^~
_[Number][api.type.Number]._ Produces pressure on tensile particles in a range of about `0` to `0.2`. Larger values increase the amount of surface tension.

##### surfaceTensionNormalStrength ~^(optional)^~
_[Number][api.type.Number]._ Smoothes outline of tensile particles in a range of about `0` to `0.2`. Larger values result in rounder, smoother, <nobr>water-like</nobr> clusters of particles.

##### repulsiveStrength ~^(optional)^~
_[Number][api.type.Number]._ Produces additional pressure on repulsive particles. Larger values repulse more and negative values mean attraction. The stability range of particles is about `-0.2` to `2.0`.

##### powderStrength ~^(optional)^~
_[Number][api.type.Number]._ Produces repulsion between powder particles. Larger values repulse more.

##### ejectionStrength ~^(optional)^~
_[Number][api.type.Number]._ Pushes particles out of solid particle group. Larger values repulse more.

##### staticPressureStrength ~^(optional)^~
_[Number][api.type.Number]._ Produces static pressure. Larger values increase the pressure on neighboring particles. For a description of static pressure, refer [here](http://en.wikipedia.org/wiki/Static_pressure#Static_pressure_in_fluid_dynamics).

##### staticPressureRelaxation ~^(optional)^~
_[Number][api.type.Number]._ Reduces instability in static pressure calculation. Larger values stabilize static pressure with fewer iterations.

##### staticPressureIterations ~^(optional)^~
_[Number][api.type.Number]._ Changes the number of iterations when calculating the static pressure of particles. By default this is `8` iterations. You can reduce the number of iterations down to `1` in some situations, but this may cause instability when many particles come together. If you see particles popping away from each other like popcorn, you may have to increase the number of iterations. For a description of static pressure, refer [here](http://en.wikipedia.org/wiki/Static_pressure#Static_pressure_in_fluid_dynamics).

##### strictContactCheck ~^(optional)^~
_[Boolean][api.type.Boolean]._ Specifies whether the strict particle/body contact check should be enabled. This value is `false` by default.

##### colorMixingStrength ~^(optional)^~
_[Number][api.type.Number]._ Determines how fast colors are mixed. A value of `1.0` mixes particles immediately while a value of `0.5` mixes particles halfway on each simulation step.

##### destroyByAge ~^(optional)^~
_[Boolean][api.type.Boolean]._ Specifies whether to destroy particles by age when no more particles can be created.

##### lifetimeGranularity ~^(optional)^~
_[Number][api.type.Number]._ Granularity of particle lifetimes in seconds. The maximum lifetime of a particle is `(2^32 - 1) / (1.0f / lifetimeGranularity)` seconds, so with the value set to `1/60` the maximum lifetime or age of a particle is 2.27 years.

##### blendEquation ~^(optional)^~
_[String][api.type.String]._ Sets the particle blending equation. Acceptable values are `"subtract"`, `"reverseSubtract"`, or `"disabled"`.

##### blendMode ~^(optional)^~
_[String][api.type.String] or [Table][api.type.Table]._ Sets the particle blending mode. Acceptable string values are `"add"`, `"multiply"`, `"screen"`, or `"normal"`. This can also be a table of <nobr>key-value</nobr> pairs based on the custom blend modes described [here][api.type.Paint.blendMode#custom-blend-modes]. For&nbsp;example:

<div class="code-indent" style="width:650px;">

`````lua
blendMode = { srcColor="one", srcAlpha="one", dstColor="one", dstAlpha="one" }
`````

</div>


## Examples

`````lua
local particleSystem = physics.newParticleSystem(
	{
		filename = "particle.png",
		radius = 3
	}
)
`````

`````lua
local particleSystem = physics.newParticleSystem(
	{
		filename = "particle.png",
		radius = 4,
		imageRadius = 6,
		colorMixingStrength = 0.1,
		blendMode = "add"
	}
)
`````
