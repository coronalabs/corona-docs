
# event.isCtrlDown

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [mouse][api.event.mouse]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mouse, isCtrlDown
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates if the ctrl button was held down at the time the mouse event occurred.

## Example
 
``````lua
-- Called when a mouse event has been received.
local function onMouseEvent( event )
    if event.isCtrlDown then
        -- The ctrl button is currently pressed down.
    else
        -- The ctrl button is not being pressed.
    end
end
                             
-- Add the mouse event listener.
Runtime:addEventListener( "mouse", onMouseEvent )
``````
