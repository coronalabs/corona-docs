
# event.name

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [touch][api.event.touch]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          touch, name
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The name of the event, `"touch"`, which is accessible via the [touch event][api.event.touch] listener.

## Example
 
``````lua
local object = display.newImage( "ball.png" )

function object:touch( event )
    if event.phase == "began" then
        print( "Event dispatched; name: " .. event.name )
    end
    return true
end 
object:addEventListener( "touch", object )
``````
