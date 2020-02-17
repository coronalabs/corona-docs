
# event.time

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [touch][api.event.touch]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          touch, time
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides an easy way to get the time in milliseconds since the start of the application, from within a touch event listener function.

## Example
 
``````lua
local object = display.newImage( "ball.png" )

function object:touch( event )
    if event.phase == "began" then
        print(event.time/1000 .. " seconds since app started." )
    end
    return true
end
object:addEventListener( "touch", object )

``````
