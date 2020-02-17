
# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [touch][api.event.touch]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          touch, phase
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string identifying where in the touch sequence the event occurred. Can be one of the following values:

* `"began"` — indicates that a touch has started on the screen.
* `"moved"` — indicates that a touch has moved on the screen.
* `"ended"` — indicates that a touch has been lifted from the screen.
* `"cancelled"` — indicates that the __system__ cancelled tracking of the touch (not to be confused with `"ended"`).


## Example
 
``````lua
local object = display.newImage( "ball.png" )

function object:touch( event )
    if event.phase == "began" then

        display.getCurrentStage():setFocus( self )
        self.isFocus = true

    elseif self.isFocus then
        if event.phase == "moved" then

            print( "moved phase" )

        elseif event.phase == "ended" or event.phase == "cancelled" then

            display.getCurrentStage():setFocus( nil )
            self.isFocus = false
        end
    end

    return true
end
object:addEventListener( "touch", object )
``````
