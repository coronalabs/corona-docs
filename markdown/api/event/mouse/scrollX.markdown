
# event.scrollX

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [mouse][api.event.mouse]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mouse, scrollX
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The mouse scroll's current __x scrolling__ value. This value depends on user mouse settings.

## Example
 
``````lua
-- Called when a mouse event has been received.
local function onMouseEvent( event )
    if event.type == "scroll" then
        if event.scrollX < 0 then
            print( "Mouse is scrolling left with a value of " .. event.scrollX .. "." )
        elseif event.scrollX > 0 then
            print( "Mouse is scrolling right with a value of " .. event.scrollX .. "." )
        end
    end
end

-- Add the mouse event listener.
Runtime:addEventListener( "mouse", onMouseEvent )
``````