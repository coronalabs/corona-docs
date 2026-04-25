# object:getWorldVector()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, local, world, vector
> __See also__          [object:getLinearVelocityFromWorldPoint()][api.type.Body.getLinearVelocityFromWorldPoint]
>                       [object:getLinearVelocityFromLocalPoint()][api.type.Body.getLinearVelocityFromLocalPoint]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Transforms a vector from the body's local coordinate system to the world coordinate system. The input vector `(x, y)` is expressed relative to the body's center (in pixels), and the method returns the corresponding vector in world space (also in pixels), correctly accounting for the body's rotation.

## Syntax

	object:getWorldVector( x, y )

##### x ~^(required)^~
_[Number][api.type.Number]._ The x component of the vector in local space (pixels).

##### y ~^(required)^~
_[Number][api.type.Number]._ The y component of the vector in local space (pixels).

## Return Value

Two numbers: the x and y components of the rotated vector in world space (pixels). If the body is absent, `nil` is returned for both.

## Example

`````lua
-- Create a rectangle and add a physics body
local myRect = display.newRect( 100, 100, 60, 60 )
physics.addBody( myRect, "dynamic" )

-- Apply some rotation
myRect.rotation = 45

-- Convert a local upward vector (pointing to the 'top' of the body)
local wx, wy = myRect:getWorldVector( 0, -50 )
print( "World direction from local (0, -50): " .. wx .. ", " .. wy )
`````
