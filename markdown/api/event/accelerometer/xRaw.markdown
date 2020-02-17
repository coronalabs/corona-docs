
# event.xRaw

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [accelerometer][api.event.accelerometer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          accelerometer, xRaw
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides the acceleration due to gravity relative to the x-axis of the device's screen in portrait orientation.

This is the raw value received from the device's sensor. No filtering or smoothing is applied to it.

## Gotchas

This value is always relative to the device in portrait orientation, regardless of the current orientation of your application. So, if your application is running in landscape mode, you'll need to compensate by 90 degrees.

## Example
 
``````lua
local function onAccelerate( event )
    print( event.name, event.xRaw, event.yRaw, event.zRaw )
end
 
Runtime:addEventListener( "accelerometer", onAccelerate )
``````
