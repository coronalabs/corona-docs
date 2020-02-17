# object.isAwake

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, isAwake
> __See also__          [object.isBodyActive][api.type.Body.isBodyActive]
>								[object.isSleepingAllowed][api.type.Body.isSleepingAllowed]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A [boolean][api.type.Boolean] for the body's current "awake" state. By default, all bodies automatically "sleep" when nothing interacts with them for a couple of seconds. At this point, they stop being simulated until something like a collision wakes them up. The `isAwake` property can either fetch a body's current state or forcibly wake it up.

## Example

``````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 100, 100 )

-- Add a body to the rectangle
physics.addBody( myRect, "dynamic" )

-- Set the rectangle's "awake" state to true
myRect.isAwake = true
``````