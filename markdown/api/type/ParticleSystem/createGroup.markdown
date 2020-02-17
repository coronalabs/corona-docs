# object:createGroup()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          createGroup, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
>						[object:destroyParticles()][api.type.ParticleSystem.destroyParticles]
>						[object:createParticle()][api.type.ParticleSystem.createParticle]
>						[particleCollision][api.event.particleCollision]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function is used to create multiple particles simultaneously by filling a region.


## Syntax

	ParticleSystem:createGroup( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ A table that specifies the particle group properties (flags) — see the next section for valid entries.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

When implementing particle collisions via the [particleCollision][api.event.particleCollision] event, you must set the `"fixtureContactListener"` flag for the particle group. If this flag is omitted, you will not receive particle collision responses.

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

##### groupFlags ~^(optional)^~
_[String][api.type.String] or [Table][api.type.Table]._ One of the following strings or a table containing a <nobr>comma-delimited</nobr> list of these strings.

* `"solid"`
* `"rigid"`
* `"canBeEmpty"`
* `"willBeDestroyed"`
* `"needsUpdateDepth"`
* `"internalMask"`

##### x ~^(optional)^~
_[Number][api.type.Number]._ The starting __x__ position of the generated group, in content space.

##### y ~^(optional)^~
_[Number][api.type.Number]._ The starting __y__ position of the generated group, in content space.

##### angle ~^(optional)^~
_[Number][api.type.Number]._ The starting angle (rotation) of the generated group.

##### linearVelocityX ~^(optional)^~
_[Number][api.type.Number]._ The __x__ velocity of the generated group.

##### linearVelocityY ~^(optional)^~
_[Number][api.type.Number]._ The __y__ velocity of the generated group.

##### angularVelocity ~^(optional)^~
_[Number][api.type.Number]._ The angular velocity of the generated group.

##### color ~^(optional)^~
_[Table][api.type.Table]._ Table of RGB+A color settings for the particles in the group.

<div class="code-indent" style="width:300px;">

``````lua
color = { 0, 0.3, 1, 1 }
``````

</div>

##### strength ~^(optional)^~
_[Number][api.type.Number]._ The cohesion of a group of particles in the range of `0.0` (least&nbsp;cohesive) to `1.0` (most&nbsp;cohesive). Default value is `1.0`.

##### stride ~^(optional)^~
_[Number][api.type.Number]._ The interval of particles in the group.

##### lifetime ~^(optional)^~
_[Number][api.type.Number]._ Lifetime of the generated group, in seconds.

### Rectangular Group

##### halfWidth ~^(optional)^~
_[Number][api.type.Number]._ Half the width of the desired rectangular particle group.

##### halfHeight ~^(optional)^~
_[Number][api.type.Number]._ Half the height of the desired rectangular particle group.

### Circular Group

##### radius ~^(optional)^~
_[Number][api.type.Number]._ Radius of the desired circular particle group.

### Arbitrary Shape

##### shape ~^(optional)^~
_[Array][api.type.Array]._ Array of up to eight __x__ and __y__ coordinates to generate an arbitrary convex shape group.

### Outlined Shape

##### outline ~^(optional)^~
_[Table][api.type.Table]._ Shape table returned by [graphics.newOutline()][api.library.graphics.newOutline].


## Examples

##### Rectangular Group

``````lua
ParticleSystem:createGroup(
	{
		flags = { "water", "colorMixing" },
		x = 0,
		y = 0,
		color = { 0, 0, 1, 1 },
		halfWidth = 64,
		halfHeight = 32
	}
)
``````

##### Circular Group

``````lua
ParticleSystem:createGroup(
	{
		flags = "elastic",
		x = 0,
		y = 0,
		color = { 1, 0, 1, 1 },
		radius = 32
	}
)
``````

##### Arbitrary Shape

``````lua
ParticleSystem:createGroup(
	{
		flags = { "elastic", "colorMixing" },
		x = 0,
		y = 0,
		color = { 0, 1, 0, 1 },
		shape = { 0,0, 64,64, 0,64 }
	}
)
``````
	
##### Outlined Shape

``````lua
local imageOutline = graphics.newOutline( 2, "outline.png" )

ParticleSystem:createGroup(
	{
		flags = "water",
		x = 0,
		y = 0,
		color = { 1, 1, 0, 1 },
		outline = imageOutline
	}
)
``````