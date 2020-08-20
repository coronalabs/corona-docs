
# lateUpdate

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          lateUpdate, runtime
> __See also__          [Basic Interactivity and Event Detection][guide.events.detectEvents] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

`"lateUpdate"` events occur at the <nobr>frames-per-second</nobr> interval of the application, either 30 or 60 as specified in `config.lua`. They are only dispatched to the global [Runtime][api.type.EventDispatcher] object.

This is dispatched after the `"enterFrame"` event, and right before the engine starts the rendering process. For this reason, it is useful to make any last update according to it's state. Also, it is intended to be a safe call for all those who are listening to this event, otherwise, it loses it's purpose.

## Properties

#### [event.name][api.event.lateUpdate.name]

#### [event.time][api.event.lateUpdate.time]


## Example

``````lua
local shouldUpdate = false
local rect = display.newRect(100, 100, 30, 30)
local x, y

-- Change the state
local touchListener = function( event )
    x, y = event.x, event.y
    shouldUpdate = true

    print("I need to update my position.") -- This could be call more than once each frame.
    
    return true
end 
rect:addEventListener("touch", touchListener)


-- Interpretation of the new state
local myListener = function( event )
    if not shouldUpdate then return false end
    shouldUpdate = false

    rect.x, rect.y = x, y

    print("Position updated!") -- This is going to be called just once, before the game renders.
end
Runtime:addEventListener( "lateUpdate", myListener )
``````
