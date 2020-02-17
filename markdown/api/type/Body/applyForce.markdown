# object:applyForce()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, applyForce
> __See also__          [object:applyLinearImpulse()][api.type.Body.applyLinearImpulse]
>								[object:applyTorque()][api.type.Body.applyTorque]
>								[object:applyAngularImpulse()][api.type.Body.applyAngularImpulse]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

A function that accepts __x__ and __y__ components of a linear force, applied at a given point with __x__ and __y__ world coordinates. If the target point is the body's center of mass, it will tend to push the body in a straight line; if the target is offset from the body's center of mass, the body will spin about its center of mass.

For symmetrical objects, the center of mass and the center of the object will have the same position ([object.x][api.type.DisplayObject.x] and [object.y][api.type.DisplayObject.y]).

Note that the amount of force required to move heavy objects may need to be fairly high.

## Syntax

	object:applyForce( xForce, yForce, bodyX, bodyY )
	
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

-- Apply force
myRect:applyForce( 50, 200, myRect.x, myRect.y )
``````