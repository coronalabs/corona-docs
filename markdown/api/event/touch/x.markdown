
# event.x

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [touch][api.event.touch]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          touch, x
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The __x__ position in screen coordinates of the touch.

## Example
 
``````lua
local circle = display.newCircle( 50, 50, 100 )
circle:setFillColor( 0, 1, 0 )
local function moveCircle( event )
    circle.x = event.x
    circle.y = event.y
end

Runtime:addEventListener( "touch", moveCircle )
``````
