
# event.time

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [mouse][api.event.mouse]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mouse, time
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The time this mouse event occurred in milliseconds since the start of the application.

## Example
 
``````lua
-- Called when a mouse event has been received.
local function onMouseEvent( event )
    -- Print the mouse event's timestamp to the log.
    local message = "Mouse Event Timestamp = " .. tostring(event.time)
    print( message )
end
                             
-- Add the mouse event listener.
Runtime:addEventListener( "mouse", onMouseEvent )
``````
