# object:getLinearVelocityFromLocalPoint()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, velocity, local point, linear velocity
> __See also__          [object:getLinearVelocityFromWorldPoint()][api.type.Body.getLinearVelocityFromWorldPoint]
>                       [object:getLinearVelocity()][api.type.Body.getLinearVelocity]
>                       [object:getWorldVector()][api.type.Body.getWorldVector]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns the world‑space linear velocity of a point on the body, given that point’s coordinates in the body’s **local** coordinate system. This is especially useful for finding the velocity at a specific attachment point (like a joint anchor) on a rotating physics object.

The resulting velocity is the vector sum of the body’s center‑of‑mass velocity and the tangential velocity caused by rotation at that local point.

## Syntax

	object:getLinearVelocityFromLocalPoint( localX, localY )

##### localX ~^(required)^~
_[Number][api.type.Number]._ The x coordinate of the point in the body’s local space (pixels, relative to the body’s center).

##### localY ~^(required)^~
_[Number][api.type.Number]._ The y coordinate of the point in the body’s local space (pixels, relative to the body’s center).

## Return Value

Two numbers: the x and y components of the world velocity at that local point, in **pixels per second**. If the body is absent, `nil` is returned for both.

## Example

`````lua
-- Create a rectangle and add a physics body
local myRect = display.newRect( 200, 200, 80, 40 )
physics.addBody( myRect, "dynamic", { density = 1.0 } )

-- Give it linear motion and a spin
myRect:setLinearVelocity( 50, 0 )   -- moving right
myRect.angularVelocity = 90         -- rotating

-- Pick a local point offset from the center (e.g., right side)
local localX, localY = 40, 0

-- Get the velocity of that local point in world space
local vx, vy = myRect:getLinearVelocityFromLocalPoint( localX, localY )
if vx and vy then
	print( "Velocity at local (" .. localX .. ", " .. localY .. "): " .. vx .. ", " .. vy )
end
`````
