
# physics.queryRegion()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      Array of tables describing each hit
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          queryRegion, physics, collision
> __See also__          [physics.reflectRay()][api.library.physics.rayCast]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This function is used to find the objects that intersect with an axis-aligned (non-rotated) box. This box is defined by an <nobr>upper-left</nobr> coordinate and a <nobr>lower-right</nobr> coordinate.

The positions returned are in content space.


## Syntax

	physics.queryRegion( upperLeftX, upperLeftY, lowerRightX, lowerRightY )

##### upperLeftX ~^(required)^~
_[Number][api.type.Number]._ The upper-left __x__ coordinate for the box region.

##### upperLeftY ~^(required)^~
_[Number][api.type.Number]._ The upper-left __y__ coordinate for the box region.

##### lowerRightX ~^(required)^~
_[Number][api.type.Number]._ The lower-right __x__ coordinate for the box region.

##### lowerRightY ~^(required)^~
_[Number][api.type.Number]._ The lower-right __y__ coordinate for the box region.


## Result Properties

`hits` will be an array of each [DisplayObject][api.type.DisplayObject] colliding with the box region.


## Example

`````lua
local hits = physics.queryRegion( 10, 40, 100, 160 )

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