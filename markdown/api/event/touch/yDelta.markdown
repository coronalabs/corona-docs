
# event.yDelta

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [touch][api.event.touch]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          touch, yDelta
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The __y__ distance in screen coordinates between where the touch event began and its current coordinates.

## Example

``````lua
local object = display.newRect( display.contentCenterX, display.contentCenterY, 100, 100 )

local function move( event )
    if ( event.phase == "began" ) then
        display.getCurrentStage():setFocus( event.target )
        event.target.xStart = event.target.x
        event.target.yStart = event.target.y
	event.target.isFocus = true

    elseif ( event.phase == "moved" ) then
        if ( event.target.isFocus ) then
            event.target.x = event.target.xStart + event.xDelta
            event.target.y = event.target.yStart + event.yDelta
        end

    else
        display.getCurrentStage():setFocus( nil )
        event.target.isFocus = false

    end
end

object:addEventListener( "touch", move )
``````
