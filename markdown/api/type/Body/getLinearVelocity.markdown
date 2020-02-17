# object:getLinearVelocity()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, getLinearVelocity
> __See also__          [object:setLinearVelocity()][api.type.Body.setLinearVelocity]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

A function that returns the __x__ and __y__ components for the body's linear velocity, in pixels per second.

## Syntax

	object:getLinearVelocity()

## Example

``````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 100, 100 )

-- Add a body to the rectangle
physics.addBody( myRect, "dynamic" )

-- Start moving the rectangle
myRect:setLinearVelocity( 50, 20 )

-- Get the linear velocity values
local vx, vy = myRect:getLinearVelocity()
``````
