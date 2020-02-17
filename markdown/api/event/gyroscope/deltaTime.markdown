
# event.deltaTime

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [gyroscope][api.event.gyroscope]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gyroscope, deltaTime
> __See also__          [system.setGyroscopeInterval()][api.library.system.setGyroscopeInterval]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The time in seconds since the last gyroscope event.

## Gotchas

Gyroscope measurements will not be recorded at the exact times specified by the [system.setGyroscopeInterval()][api.library.system.setGyroscopeInterval] function. This means you cannot assume that a configured interval of 10 Hz (i.e.: 100 milliseconds) will yield measurements recorded exactly 100 milliseconds apart. These measurements will likely be recorded slightly late. This is a limitation of the operating system on both iOS and Android. To compensate for this, event.deltaTime is provided to help make your rotational calculations as accurate as possible.

You can use `event.deltaTime` to calculate the approximate rotation distance traveled since the last gyroscope measurement with the following equation:

<div class="code-indent">

_delta radians = rotation rate * delta time_

</div>

Please note that this is an approximation, because the device has not likely rotated at a constant speed since the last gyroscope measurement. This means that the summed distance over time will grow in error. Increasing the measurement update interval via the [system.setGyroscopeInterval()][api.library.system.setGyroscopeInterval] function will help reduce that error.

## Example
 
``````lua
-- Called when a new gyroscope measurement has been received
local function onGyroscopeDataReceived( event )
    -- Calculate approximate rotation traveled via delta time
    -- Remember that rotation rate is in radians per second
    local deltaRadians = event.zRotation * event.deltaTime
    local deltaDegrees = deltaRadians * (180/math.pi)
end
 
-- Set up the above function to receive gyroscope events if the sensor exists
if system.hasEventSource( "gyroscope" ) then
    Runtime:addEventListener( "gyroscope", onGyroscopeDataReceived )
end
``````
