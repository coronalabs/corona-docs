
# event.time

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [lateUpdate][api.event.lateUpdate]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          lateUpdate, time
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The time in milliseconds since the start of the application accessible by an lateUpdate event listener function (which is called on every frame, until the event listener is removed).

## Example
 
``````lua
function printTimeSinceStart( event )
    print (event.time/1000 .. " seconds since app started." )
end 
Runtime:addEventListener("lateUpdate", printTimeSinceStart)
``````
