# object.linearDamping

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, linearDamping
> __See also__          [object:setLinearVelocity()][api.type.Body.setLinearVelocity]
>								[object:applyLinearImpulse()][api.type.Body.applyLinearImpulse]
>								[object:applyForce()][api.type.Body.applyForce]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The numerical value for how much the body's linear motion is damped. The default is zero&nbsp;(`0`).

## Example

``````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 100, 100 )

-- Add a body to the rectangle
physics.addBody( myRect, "dynamic" )

-- Set the rectangle's linear damping
myRect.linearDamping = 5
``````
