
# event.isAltDown

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [mouse][api.event.mouse]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mouse, isAltDown
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates if the alt button was held down at the time the mouse event occurred.

## Example
 
``````lua
-- Called when a mouse event has been received.
local function onMouseEvent( event )
    if event.isAltDown then
        -- The alt button is currently pressed down.
    else
        -- The alt button is not being pressed.
    end
end
                             
-- Add the mouse event listener.
Runtime:addEventListener( "mouse", onMouseEvent )
``````
