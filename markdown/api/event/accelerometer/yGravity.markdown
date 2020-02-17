
# event.yGravity

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [accelerometer][api.event.accelerometer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          accelerometer, yGravity
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides the acceleration due to gravity relative to the y-axis of the device's screen in portrait orientation.

This value is "smoothed" based on the previous accelerometer readings in order to reduce a jittering effect when used to manipulate graphics on screen.

## Gotchas

This value is always relative to the device in portrait orientation, regardless of the current orientation of your application. So, if your application is running in landscape mode, you'll need to compensate by 90 degrees.

## Example
 
``````lua
local function onAccelerate( event )
    print( event.name, event.xGravity, event.yGravity, event.zGravity )
end
 
Runtime:addEventListener( "accelerometer", onAccelerate )
``````
