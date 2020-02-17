# object:queryRegion()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Array][api.type.Array]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          queryRegion, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
>                       [object:rayCast()][api.type.ParticleSystem.rayCast]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function is used to find the particles that intersect with an <nobr>axis-aligned</nobr> <nobr>(non-rotated)</nobr> box. This box is defined by an <nobr>upper-left</nobr> coordinate and a <nobr>lower-right</nobr> coordinate.

This function returns an [array][api.type.Array] of tables describing each hit. The positions returned are in content space.


## Syntax

	ParticleSystem:queryRegion( upperLeftX, upperLeftY, lowerRightX, lowerRightY, hitProperties )

##### upperLeftX ~^(required)^~
_[Number][api.type.Number]._ The upper-left __x__ coordinate for the box region.

##### upperLeftY ~^(required)^~
_[Number][api.type.Number]._ The upper-left __y__ coordinate for the box region.

##### lowerRightX ~^(required)^~
_[Number][api.type.Number]._ The lower-right __x__ coordinate for the box region.

##### lowerRightY ~^(required)^~
_[Number][api.type.Number]._ The lower-right __y__ coordinate for the box region.

##### hitProperties ~^(optional)^~
_[Table][api.type.Table]._ Table of optional properties which can be applied to each particle in the region. Acceptable options include:

* `deltaX` &mdash; The __x__ position delta to apply to each particle.
* `deltaY` &mdash; The __y__ position delta to apply to each particle.
* `velocityX` &mdash; The __x__ velocity to apply to each particle.
* `velocityY` &mdash; The __y__ velocity to apply to each particle.
* `deltaVelocityX` &mdash; The __x__ velocity delta to apply to each particle.
* `deltaVelocityY` &mdash; The __y__ velocity delta to apply to each particle.


## Result Properties

`hits` will be an array of elements containing these properties:

* `x` &mdash; The __x__ position of the particle in content space.
* `y` &mdash; The __y__ position of the particle in content space.


## Example

`````lua
local hits = ParticleSystem:queryRegion(
    10, 40,
    100, 160,
    { deltaVelocityY = -40 }  --apply delta Y velocity of -40 to each particle in region
)

if ( hits ) then

    -- There's at least one hit
    print( "Hit count: " .. tostring( #hits ) )

    -- Output the results
    for i,v in ipairs( hits ) do
        print( "Object position: ", v.x, v.y )
    end
else
    -- No hits in region
end
`````
