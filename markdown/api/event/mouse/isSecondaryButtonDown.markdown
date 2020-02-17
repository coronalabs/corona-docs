
# event.isSecondaryButtonDown

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [mouse][api.event.mouse]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mouse, isSecondaryButtonDown
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates if the mouse's secondary button was held down at the time the mouse event occurred.

Note that the secondary button is typically the right mouse button, unless the end-user has had it swapped with the left mouse button.

## Gotchas

Android devices older than version 4.0 do not support the secondary mouse button. This property will always be set `false` for those older devices.

## Example
 
``````lua
-- Called when a mouse event has been received.
local function onMouseEvent( event )
    if event.isSecondaryButtonDown then
        -- The mouse's secondary/right button is currently pressed down.
    else
        -- The mouse's secondary/right button is not being pressed.
    end
end
                             
-- Add the mouse event listener.
Runtime:addEventListener( "mouse", onMouseEvent )
``````
