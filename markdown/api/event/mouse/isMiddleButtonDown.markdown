
# event.isMiddleButtonDown

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [mouse][api.event.mouse]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mouse, isMiddleButtonDown
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates if the mouse's middle button was held down at the time the mouse event occurred.

## Gotchas

Android devices older than version 4.0 do not support the middle mouse button. This property will always be set `false` for those older devices.

## Example
 
``````lua
-- Called when a mouse event has been received.
local function onMouseEvent( event )
    if event.isMiddleButtonDown then
        -- The mouse's middle button is currently pressed down.
    else
        -- The mouse's middle button is not being pressed.
    end
end
                             
-- Add the mouse event listener.
Runtime:addEventListener( "mouse", onMouseEvent )
``````
