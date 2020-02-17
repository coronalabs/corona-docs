# object:rayCast()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [ParticleSystem][api.type.ParticleSystem]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Array][api.type.Array]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          rayCast, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
>                       [object:queryRegion()][api.type.ParticleSystem.queryRegion]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function is used to find the particles that collide with a line. It returns an [array][api.type.Array] of tables describing each hit.


## Gotchas

If the starting position is inside a particle, no hit will be registered for that particle.


## Syntax

	ParticleSystem:rayCast( from_x, from_y, to_x, to_y, behavior )

##### from_x ~^(required)^~
_[Number][api.type.Number]._ The starting __x__ position of the ray.

##### from_y ~^(required)^~
_[Number][api.type.Number]._ The starting __y__ position of the ray.

##### to_x ~^(required)^~
_[Number][api.type.Number]._ The ending __x__ position of the ray.

##### to_y ~^(required)^~
_[Number][api.type.Number]._ The ending __y__ position of the ray.

##### behavior ~^(optional)^~
_[String][api.type.String]._ The collision test behavior, in increasing order of performance cost:

* `"any"` &mdash; Return one result, but not necessarily the closest one.
* `"closest"` &mdash; Return only the closest hit from the starting point, if any. This is the default behavior.
* `"unsorted"` &mdash; Return all results in no particular order.
* `"sorted"` &mdash; Return all results, sorted from closest to farthest.


## Result Properties

`hits` will be an array of elements containing these properties:

* `x` &mdash; The __x__ collision position in content space.
* `y` &mdash; The __y__ collision position in content space.
* `normal.x` &mdash; The __x__ component of the normal of the surface hit in local space.
* `normal.y` &mdash; The __y__ component of the normal of the surface hit in local space.
* `fraction` &mdash; The fraction (`0`..`1`) along the ray where the hit is located. `0` is the start point of the ray cast and `1` is the end point.


## Example

`````lua
local hits = ParticleSystem:rayCast( 0, 0, 200, 300, "closest" )

if ( hits ) then

    -- There's at least one hit
    print( "Hit count: " .. tostring( #hits ) )

    -- Output the results
    for i,v in ipairs( hits ) do
        print( "Hit: ", i, " Position: ", v.x, v.y, " Surface normal: ", v.normal.x, v.normal.y )
    end

    print( "The first particle hit at position: ", hits[1].position.x, hits[1].position.y,
           " where the surface normal is: ", hits[1].normal.x, hits[1].normal.y,
           " and where the fraction along the ray is: ", hits[1].fraction )
else
    -- No hits on raycast
end
`````
