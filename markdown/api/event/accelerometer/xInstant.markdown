
# event.xInstant

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [accelerometer][api.event.accelerometer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          accelerometer, xInstant
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides the change of acceleration relative to the x-axis of the device's screen in portrait orientation. This value is [xGravity][api.event.accelerometer.xGravity] minus the previous [xGravity][api.event.accelerometer.xGravity] reading, which provides the delta acceleration relative to zero.

The intent of this value is to detect if the device was "jerked" in a particular direction.

## Gotchas

This value is always relative to the device in portrait orientation, regardless of the current orientation of your application. So, if your application is running in landscape mode, you'll need to compensate by 90 degrees.

## Example
 
``````lua
local function onAccelerate( event )
    print( event.name, event.xInstant, event.yInstant, event.zInstant )
end
 
Runtime:addEventListener( "accelerometer", onAccelerate )
``````
