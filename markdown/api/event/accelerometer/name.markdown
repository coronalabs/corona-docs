
# event.name

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [accelerometer][api.event.accelerometer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          accelerometer, name
> --------------------- ------------------------------------------------------------------------------------------

## Overview

For accelerometer events this property is set to `"accelerometer"`.

## Example
 
``````lua
local function onAccelerate( event )
    print( event.name, event.xGravity, event.yGravity )
end
 
Runtime:addEventListener( "accelerometer", onAccelerate )
``````
