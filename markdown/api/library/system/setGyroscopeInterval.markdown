# system.setGyroscopeInterval()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gyroscope
> __See also__          [gyroscope][api.event.gyroscope]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the frequency of [gyroscope][api.event.gyroscope] events in Hz. Gyroscope events are a significant drain on battery, so only increase the frequency when you need faster responses. 

## Gotchas

### Battery Life

If possible, lower the frequency to conserve battery life.

### iOS

On iOS devices, these are the frequency limits:

* Maximum value: 100 Hz
* Minimum value: 10 Hz


## Syntax

	system.setGyroscopeInterval( frequency )

##### frequency ~^(required)^~
_[Number][api.type.Number]._ Sets the sample interval in Hertz (cycles per second), i.e. the number of measurements to take per second. If you set the frequency to 10, then the system will take 10 measurements per second.

## Examples

``````lua
-- Set the measurement interval to 50 Hz.
-- This makes the system take 50 measurements per second.
system.setGyroscopeInterval( 50 )
``````
