
# event.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [mouse][api.event.mouse]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mouse, type
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string identifying the type of mouse event that is occurring. Can be one of the following values:

* `"down"` — indicates that a mouse button was pressed.
* `"up"` — indicates that a mouse button was released.
* `"move"` — indicates that the mouse is moving on the screen.
* `"drag"` — indicates that the mouse is moving on the screen while a mouse button is pressed.

## Example
 
``````lua
-- Called when a mouse event has been received.
local function onMouseEvent( event )
    print( "Mouse event type is: " .. event.type )
end
                             
-- Add the mouse event listener.
Runtime:addEventListener( "mouse", onMouseEvent )
``````