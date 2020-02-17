
# event.yStart

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [touch][api.event.touch]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          touch, yStart
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The __y__ position of the touch from the `"began"` phase of the touch sequence.

## Example

``````lua
local function drawLine( event )
    if ( event.phase == "ended" ) then
        local line = display.newLine( event.xStart, event.yStart, event.x, event.y )
        line.strokeWidth = 5
    end
end

Runtime:addEventListener( "touch", drawLine )
``````
