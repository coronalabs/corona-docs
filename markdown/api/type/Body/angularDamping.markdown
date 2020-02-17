# object.angularDamping

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, angularDamping, physics
> __See also__          [object.angularVelocity][api.type.Body.angularVelocity]
>								[object:applyAngularImpulse()][api.type.Body.applyAngularImpulse]
>								[object:applyTorque()][api.type.Body.applyTorque]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The numerical value for how much the body's rotation should be damped. The default is zero&nbsp;(`0`). There is no minimum or maximum value &mdash; just adjust to get the desired results.

## Example

``````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 100, 100 )

-- Add a body to the rectangle
physics.addBody( myRect, "dynamic" )

-- Set the rectangle's angular damping
myRect.angularDamping = 5
``````
