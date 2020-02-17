# object:createParticle()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          createParticle, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
>						[object:destroyParticles()][api.type.ParticleSystem.destroyParticles]
>						[object:createGroup()][api.type.ParticleSystem.createGroup]
>						[particleCollision][api.event.particleCollision]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function is used to create a single particle in a [ParticleSystem][api.type.ParticleSystem].


## Syntax

	ParticleSystem:createParticle( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ A table that specifies the particle properties (flags) — see the next section for valid entries.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

When implementing particle collisions via the [particleCollision][api.event.particleCollision] event, you must set the `"fixtureContactListener"` flag for each particle. If this flag is omitted, you will not receive particle collision responses.

</div>


## Parameter Reference

To learn more about the parameters available for particles, please refer to the [LiquidFun Programmer's Guide](http://google.github.io/liquidfun/Programmers-Guide/html/md__chapter11__particles.html).

##### flags ~^(optional)^~
_[String][api.type.String] or [Table][api.type.Table]._ One of the following strings or a table containing a <nobr>comma-delimited</nobr> list of these strings.

* `"water"`
* `"zombie"`
* `"wall"`
* `"spring"`
* `"elastic"`
* `"viscous"`
* `"powder"`
* `"tensile"`
* `"colorMixing"`
* `"destructionListener"`
* `"barrier"`
* `"staticPressure"`
* `"reactive"`
* `"repulsive"`
* `"fixtureContactListener"`
* `"fixtureContactFilter"`
* `"particleContactFilter"`

##### x ~^(optional)^~
_[Number][api.type.Number]._ The starting __x__ position of the generated particles, in content space.

##### y ~^(optional)^~
_[Number][api.type.Number]._ The starting __y__ position of the generated particles, in content space.

##### velocityX ~^(optional)^~
_[Number][api.type.Number]._ The __x__ velocity of the generated particles.

##### velocityY ~^(optional)^~
_[Number][api.type.Number]._ The __y__ velocity of the generated particles.

##### color ~^(optional)^~
_[Table][api.type.Table]._ Table of RGB+A color settings for the generated particles.

<div style="width:300px;">

``````lua
color = { 0, 0.3, 1, 1 }
``````

</div>

##### lifetime ~^(optional)^~
_[Number][api.type.Number]._ Lifetime of the generated particles, in seconds.


## Example

`````lua
ParticleSystem:createParticle(
	{
		flags = { "water", "colorMixing" },
		x = 0,
		y = 0,
		velocityX = 256,
		velocityY = 480,
		color = { 0, 0, 1, 1 },
		lifetime = 32.0
	}
)
`````