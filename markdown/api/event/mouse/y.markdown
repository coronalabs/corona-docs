
# event.y

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [mouse][api.event.mouse]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mouse, y
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The mouse cursor's current __y__ position on screen in content coordinates.

## Example
 
``````lua
-- Called when a mouse event has been received.
local function onMouseEvent( event )
    -- Print the mouse cursor's current position to the log.
    local message = "Mouse Position = (" .. tostring(event.x) .. "," .. tostring(event.y) .. ")"
    print( message )
end
                             
-- Add the mouse event listener.
Runtime:addEventListener( "mouse", onMouseEvent )
``````
