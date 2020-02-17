# Runtime:hasEventSource()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Runtime][api.type.Runtime]
> __Library__           none
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          runtime, hasEventSource
> __See also__          [EventDispatcher:addEventListener()][api.type.EventDispatcher.addEventListener]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Determines if the device is capable of providing events for a given event source such as `"accelerometer"` or `"gyroscope"`.

This function returns `true` if the event source exists, meaning it is okay to call [EventDispatcher:addEventListener()][api.type.EventDispatcher.addEventListener] to handle its events.

It returns `false` if the event source does not exist. For example, if this returns false for `"gyroscope"` then this would indicate that the appropriate hardware was not found on the device.

## Syntax

	Runtime:hasEventSource( eventSourceName )

##### eventSourceName ~^(required)^~
_[String][api.type.String]._ The name of the event source for which to check existence. The following values are valid:

* `"accelerometer"`
* `"gyroscope"`
* `"heading"`
* `"inputDeviceStatus"`
* `"key"`
* `"location"`
* `"mouse"`
* `"multitouch"`
* `"orientation"`

## Example

``````lua
if Runtime:hasEventSource( "gyroscope" ) then
    Runtime:addEventListener( "gyroscope", myListener )
end
``````
