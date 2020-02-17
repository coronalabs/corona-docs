
# event.zInstant

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [accelerometer][api.event.accelerometer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          accelerometer, zInstant
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides the change of acceleration relative to the z-axis of the device's screen in portrait orientation. This value is [zGravity][api.event.accelerometer.zGravity] minus the previous [zGravity][api.event.accelerometer.zGravity] reading, which provides the delta acceleration relative to zero.

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
