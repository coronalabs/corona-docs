
# event.target

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [DisplayObject][api.type.DisplayObject]
> __Event__             [touch][api.event.touch]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          touch, target
> --------------------- ------------------------------------------------------------------------------------------

## Overview

`event.target` is a direct reference to the display object associated with the touch event. This value will be `nil` if this was called by a [Runtime][api.type.EventDispatcher] [touch][api.event.touch] event.

This is most commonly used with function listeners, as table listeners will normally reference the touched object using `self` instead.


## Example
 
``````lua
local object = display.newImage( "ball.png" )

local function onObjectTouch( event )
    if ( event.phase == "began" ) then
		display.getCurrentStage():setFocus( event.target )
		event.target.isFocus = true

    elseif ( event.target.isFocus ) then
		if ( event.phase == "moved" ) then
            print( "moved phase" )

        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
            display.getCurrentStage():setFocus( nil )
            event.target.isFocus = false
        end
    end

    return true
end
object:addEventListener( "touch", onObjectTouch )
``````