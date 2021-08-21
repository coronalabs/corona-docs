
# event.frame

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [enterFrame][api.event.enterFrame]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          enterframe, frame
> __See also__          [Runtime:getFrameID()][api.type.Runtime.getFrameID]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

An ID unique to the current frame of the application accessible by an enterFrame event listener function (which is called on every frame, until the event listener is removed).

## Example
 
``````lua
local function printCurrentFrameID( event )
    print ( "Current frame ID: " .. tostring(event.frame) )
end 
Runtime:addEventListener( "enterFrame", printCurrentFrameID )
``````
