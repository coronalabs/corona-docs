# object.isSleepingAllowed

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, isSleepingAllowed
> __See also__          [object.isAwake][api.type.Body.isAwake]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A [boolean][api.type.Boolean] for whether a body is allowed to "sleep." The default is `true`.


## Gotchas

Keeping bodies awake has a larger computational overhead and it's usually not required because collisions with other bodies will automatically wake them up. However, forcing the "awake" state is useful in cases such as <nobr>tilt-gravity</nobr> since sleeping bodies do not respond to changes in global gravity.

## Example

``````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 100, 100 )

-- Add a body to the rectangle
physics.addBody( myRect, "dynamic" )

-- Prevent the rectangle's ability to "sleep"
myRect.isSleepingAllowed = false
``````
