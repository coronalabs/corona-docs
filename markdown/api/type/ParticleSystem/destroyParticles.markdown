# object:destroyParticles()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          destroyParticles, physics, LiquidFun
> __See also__          [object:createGroup()][api.type.ParticleSystem.createGroup]
>						[object:createParticle()][api.type.ParticleSystem.createParticle]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function is used to remove all particles within a region. It will return a [number][api.type.Number] indicating how many particles were destroyed.


## Syntax

	ParticleSystem:destroyParticles( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ A table that specifies the region of particles to destroy — see the next section for valid entries.


## Parameter Reference

##### x ~^(optional)^~
_[Number][api.type.Number]._ The __x__ position of the destruction region, in content space.

##### y ~^(optional)^~
_[Number][api.type.Number]._ The __y__ position of the destruction region, in content space.

##### angle ~^(optional)^~
_[Number][api.type.Number]._ The starting angle (rotation) of the destruction region.

### Rectangular Region

##### halfWidth ~^(optional)^~
_[Number][api.type.Number]._ Half the width of the desired rectangular destruction region.

##### halfHeight ~^(optional)^~
_[Number][api.type.Number]._ Half the height of the desired rectangular destruction region.

### Circular Region

##### radius ~^(optional)^~
_[Number][api.type.Number]._ Radius of the desired circular destruction region.

### Arbitrary Shape

##### shape ~^(optional)^~
_[Array][api.type.Array]._ Array of up to eight __x__ and __y__ coordinates to generate an arbitrary convex destruction region.


## Example

`````lua
local number_of_particles_destroyed = ParticleSystem:destroyParticles(
	{
		x = 123,
		y = 456,
		angle = 45,
		halfWidth = 16,
		halfHeight = 16
	}
)
`````