# object:applyTorque()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, applyTorque
> __See also__          [object:applyAngularImpulse()][api.type.Body.applyAngularImpulse]
>								[object:applyForce()][api.type.Body.applyForce]
>								[object:applyLinearImpulse()][api.type.Body.applyLinearImpulse]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

A function that accepts a numerical value for applied rotational force. The body will rotate about its center of mass.


## Syntax

	object:applyTorque( appliedForce )

##### appliedForce ~^(required)^~
_[Number][api.type.Number]._ Amount of force to be applied.


## Example

``````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 100, 100 )

-- Add a body to the rectangle
physics.addBody( myRect, "dynamic" )

myRect:applyTorque( 100 )
``````
