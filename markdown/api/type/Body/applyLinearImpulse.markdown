# object:applyLinearImpulse()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, applyLinearImpulse
> __See also__          [object:applyForce()][api.type.Body.applyForce]
>								[object:setLinearVelocity()][api.type.Body.setLinearVelocity]
>								[object.linearDamping][api.type.Body.linearDamping]
>								[object:applyAngularImpulse()][api.type.Body.applyAngularImpulse]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Similar to [object:applyForce()][api.type.Body.applyForce] except that an impulse is a single momentary jolt.

## Syntax

	object:applyLinearImpulse( xForce, yForce, bodyX, bodyY )

##### xForce, yForce ~^(required)^~
_[Numbers][api.type.Number]._ Amount of force to apply in the __x__ and __y__ directions respectively.

##### bodyX, bodyY ~^(required)^~
_[Numbers][api.type.Number]._ Point on the object to apply the force to.


## Example

``````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 100, 100 )

-- Add a body to the rectangle
physics.addBody( myRect, "dynamic" )

-- Apply linear impulse
myRect:applyLinearImpulse( 60, 20, myRect.x, myRect.y )
``````