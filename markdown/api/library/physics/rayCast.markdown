
# physics.rayCast()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      Array of tables describing each hit
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ray, raycast, casting, physics, collision
> __See also__          [physics.reflectRay()][api.library.physics.reflectRay]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This function is used to find the objects that collide with a line, and the collision points along that line.

The positions returned are in content space while the normals returned are in local space.


## Gotchas

If the starting position is inside an object, no hit will be registered for that object.


## Syntax

	physics.rayCast( fromX, fromY, toX, toY, behavior )

##### fromX ~^(required)^~
_[Number][api.type.Number]._ The starting __x__ position of the ray.

##### fromY ~^(required)^~
_[Number][api.type.Number]._ The starting __y__ position of the ray.

##### toX ~^(required)^~
_[Number][api.type.Number]._ The ending __x__ position of the ray.

##### toY ~^(required)^~
_[Number][api.type.Number]._ The ending __y__ position of the ray.

##### behavior ~^(optional)^~
_[String][api.type.String]._ The collision test behavior, in increasing order of performance cost:

* `"any"` &mdash; Return one result, but not necessarily the closest one.
* `"closest"` &mdash; Return only the closest hit from the starting point, if any. This is the default behavior.
* `"unsorted"` &mdash; Return all results in no particular order.
* `"sorted"` &mdash; Return all results, sorted from closest to farthest.


## Result Properties

`hits` will be an array of elements containing these properties:

* `object` &mdash; The [DisplayObject][api.type.DisplayObject] colliding with the line.
* `position.x` &mdash; The __x__ collision position of `object`, in content space.
* `position.y` &mdash; The __y__ collision position of `object`, in content space.
* `normal.x` &mdash; The __x__ component of the normal of the surface hit in local space.
* `normal.y` &mdash; The __y__ component of the normal of the surface hit in local space.
* `fraction` &mdash; The fraction (`0`..`1`) along the ray where the hit is located. `0` is the start point of the ray cast and `1` is the end point.


## Example

`````lua
local hits = physics.rayCast( 0, 0, 200, 300, "closest" )

if ( hits ) then

    -- There's at least one hit
    print( "Hit count: " .. tostring( #hits ) )

    -- Output the results
    for i,v in ipairs( hits ) do
        print( "Hit: ", i, v.object, " Position: ", v.position.x, v.position.y, " Surface normal: ", v.normal.x, v.normal.y )
    end

    print( "The first object hit is: ", hits[1].object, " at position: ", hits[1].position.x, hits[1].position.y, " where the surface normal is: ", hits[1].normal.x, hits[1].normal.y, " and where the fraction along the ray is: ", hits[1].fraction )
else
    -- No hits on raycast
end
`````