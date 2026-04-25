# object:getLinearVelocityFromWorldPoint()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, velocity, world point, linear velocity
> __See also__          [object:getLinearVelocityFromLocalPoint()][api.type.Body.getLinearVelocityFromLocalPoint]
>                       [object:getWorldVector()][api.type.Body.getWorldVector]
>                       [object:getLinearVelocity()][api.type.Body.getLinearVelocity]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns the linear velocity of the point on the body that is located at the given world‑space coordinates. This is useful when you need to know the velocity of a specific point on a rotating body — the velocity there is a combination of the body's linear velocity and its angular velocity.

## Syntax

	object:getLinearVelocityFromWorldPoint( worldX, worldY )

##### worldX ~^(required)^~
_[Number][api.type.Number]._ The x coordinate of the point in world space.

##### worldY ~^(required)^~
_[Number][api.type.Number]._ The y coordinate of the point in world space.

## Return Value

Two numbers: the x and y components of the linear velocity at that world point, in **pixels per second**. If the body is absent, `nil` is returned for both.

## Example

`````lua
-- Create a rectangle and add a physics body
local myRect = display.newRect( 150, 150, 80, 40 )
physics.addBody( myRect, "dynamic", { density = 1.0 } )

-- Give it some linear and angular velocity
myRect:setLinearVelocity( 50, 0 )   -- moving right
myRect.angularVelocity = 90         -- rotating clockwise (degrees per second)

-- Choose a world point away from the center (e.g., near the right edge)
local worldX, worldY = myRect.x + 40, myRect.y + 20

-- Get the velocity of that point
local vx, vy = myRect:getLinearVelocityFromWorldPoint( worldX, worldY )
if vx and vy then
	print( "Velocity at world point (" .. worldX .. ", " .. worldY .. "): " .. vx .. ", " .. vy )
end
`````
