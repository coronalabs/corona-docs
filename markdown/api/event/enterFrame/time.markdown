
# event.time

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [enterFrame][api.event.enterFrame]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          enterframe, time
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The time in milliseconds since the start of the application accessible by an enterFrame event listener function (which is called on every frame, until the event listener is removed).

## Example
 
``````lua
function printTimeSinceStart( event )
    print (event.time/1000 .. " seconds since app started." )
end 
Runtime:addEventListener("enterFrame", printTimeSinceStart)
``````
