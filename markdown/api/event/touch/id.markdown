
# event.id

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [userdata][api.type.userdata]
> __Event__             [touch][api.event.touch]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          touch, multitouch, id
> __See also__			[Tap/Touch/Multitouch][guide.events.touchMultitouch] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A unique identifier of the chosen touch that enables you to distinguish between multiple touches across different touch events. This uniquely identifies a given finger touching the screen as that touch changes state, for example as the touch generates new touch events such as `"moved"`, `"ended"`, etc.

## Example
 
``````lua
system.activate( "multitouch" )

local object = display.newImage( "ball.png" )
object.numTouches = 0

function object:touch( event )
    if event.phase == "began" then
        display.getCurrentStage():setFocus( self, event.id )
        self.numTouches = self.numTouches + 1

        if self.numTouches >= 2 then
            print( "This object is being multi-touched." )
        end
    
    elseif event.phase == "cancelled" or event.phase == "ended" then

        self.numTouches = self.numTouches - 1

        if self.numTouches <= 0 then
            display.getCurrentStage():setFocus( nil )
        end
    end
    return true
end
object:addEventListener( "touch", object )
``````
