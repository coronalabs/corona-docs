# object:applyAngularImpulse()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, applyAngularImpulse
> __See also__          [object:applyTorque()][api.type.Body.applyTorque]
>								[object.angularVelocity][api.type.Body.angularVelocity]
>								[object.angularDamping][api.type.Body.angularDamping]
>								[object:applyLinearImpulse()][api.type.Body.applyLinearImpulse]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Similar to [object:applyTorque()][api.type.Body.applyTorque] except that an angular impulse is a single momentary jolt.

## Syntax

	object:applyAngularImpulse( appliedForce )

##### appliedForce ~^(required)^~
_[Number][api.type.Number]._ Amount of force to apply.


## Example

``````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 100, 100 )

-- Add a body to the rectangle
physics.addBody( myRect, "dynamic" )

-- Apply angular impulse
myRect:applyAngularImpulse( 100 )
``````
