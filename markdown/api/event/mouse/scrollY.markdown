
# event.scrollY

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [mouse][api.event.mouse]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mouse, scrollY
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The mouse scroll's current __y scrolling__ value. This value depends on user mouse settings.

## Example
 
``````lua
-- Called when a mouse event has been received.
local function onMouseEvent( event )
    if event.type == "scroll" then
        if event.scrollY < 0 then
            print( "Mouse is scrolling up with a value of " .. event.scrollY .. "." )
        elseif event.scrollY > 0 then
            print( "Mouse is scrolling down with a value of " .. event.scrollY .. "." )
        end
    end
end

-- Add the mouse event listener.
Runtime:addEventListener( "mouse", onMouseEvent )
``````