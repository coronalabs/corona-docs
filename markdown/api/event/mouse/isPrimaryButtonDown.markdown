
# event.isPrimaryButtonDown

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [mouse][api.event.mouse]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mouse, isPrimaryButtonDown
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates if the mouse's primary button was held down at the time the mouse event occurred.

Note that the primary button is typically the left mouse button, unless the end-user has had it swapped with the right mouse button.

## Example
 
``````lua
-- Called when a mouse event has been received.
local function onMouseEvent( event )
    if event.isPrimaryButtonDown then
        -- The mouse's primary/left button is currently pressed down.
    else
        -- The mouse's primary/left button is not being pressed.
    end
end
                             
-- Add the mouse event listener.
Runtime:addEventListener( "mouse", onMouseEvent )
``````
