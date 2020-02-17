# object:setLinearVelocity()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, setLinearVelocity
> __See also__          [object:getLinearVelocity()][api.type.Body.getLinearVelocity]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function accepts __x__ and __y__ components for the body's linear velocity, in pixels per second.

## Syntax

	object:setLinearVelocity( xVelocity, yVelocity )

##### xVelocity, yVelocity ~^(required)^~
_[Numbers][api.type.Number]._ Value for the velocity in the __x__ and __y__ directions respectively.


## Example

``````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 100, 100 )

-- Add a body to the rectangle
physics.addBody( myRect, "dynamic" )

-- Set the linear velocity
myRect:setLinearVelocity( 10, 4 )
``````
