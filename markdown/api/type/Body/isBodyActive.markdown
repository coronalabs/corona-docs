# object.isBodyActive

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, isBodyActive
> __See also__          [object.isAwake][api.type.Body.isAwake]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Used to set or get the body's current active state. Inactive bodies are not destroyed but they are removed from the physics simulation and cease to interact with other bodies.

## Gotchas

If this property is set to `false` on an active object currently in collision state with another, a collision with a phase of `"ended"` will immediately be triggered. Likewise, if this property is set to `true` on an inactive object currently in collision state with another, a collision with a phase of `"began"` will immediately be triggered.

## Example

``````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 100, 100 )

-- Add a body to the rectangle
physics.addBody( myRect, "dynamic" )

-- Set the rectangle's active state
myRect.isBodyActive = false
``````