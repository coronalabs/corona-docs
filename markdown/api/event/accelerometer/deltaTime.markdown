
# event.deltaTime

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [accelerometer][api.event.accelerometer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          accelerometer, deltaTime
> __See also__          [system.setAccelerometerInterval()][api.library.system.setAccelerometerInterval]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The time in seconds since the last accelerometer event.

## Gotchas

Accelerometer measurements will not be recorded at the exact times specified by the [system.setAccelerometerInterval()][api.library.system.setAccelerometerInterval] function. This means that you cannot assume that a configured interval of 10 Hz (i.e. 100 milliseconds) will yield measurements recorded exactly 100 milliseconds apart. These measurements will likely be recorded slightly late. This is a limitation of the operating system on both iOS and Android. To compensate for this, `event.deltaTime` is provided to help make your calculations as accurate as possible.

## Example

``````lua
local function onAccelerate( event )
    print( event.deltaTime )
end

Runtime:addEventListener( "accelerometer", onAccelerate )
``````