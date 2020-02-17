
# physics.reflectRay()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      The __x__ and __y__ of the reflected ray
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ray, raycast, casting, physics, collision, reflect, reflection
> __See also__          [physics.rayCast()][api.library.physics.rayCast]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This function is used to reflect a vector as returned by [physics.rayCast()][api.library.physics.rayCast].

The reflected vector returned represents the direction of the reflection, and has a magnitude (length) of 1.


## Syntax

	physics.reflectRay( fromX, fromY, hit )

##### fromX ~^(required)^~
_[Number][api.type.Number]._ The starting __x__ position of the ray.

##### fromY ~^(required)^~
_[Number][api.type.Number]._ The starting __y__ position of the ray.

##### hit ~^(required)^~
_[Table][api.type.Table]._ An entry from the `hits` array returned by [physics.rayCast()][api.library.physics.rayCast].


## Example

`````lua
local hits = physics.rayCast( 0, 0, 200, 300, "closest" )

if ( hits ) then

    -- There's at least one hit
    print( "Hit count: " .. tostring( #hits ) )
    print( "The first object hit is: ", hits[1].object, " at position: ", hits[1].position.x, hits[1].position.y, " where the surface normal is: ", hits[1].normal.x, hits[1].normal.y )

    local reflected_ray_direction_x, reflected_ray_direction_y = physics.reflectRay( 0, 0, hits[1] )
    print( "Reflected direction: ", reflected_ray_direction_x, reflected_ray_direction_y )
    
else
    -- No hits
end
`````