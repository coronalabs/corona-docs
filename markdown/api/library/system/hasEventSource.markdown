# system.hasEventSource()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system event
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a boolean `true` or `false` depending on whether the system delivers events corresponding to `eventName`.


## Syntax

	system.hasEventSource( eventName )

##### eventName ~^(required)^~
_[String][api.type.String]._ The name of the event source that delivers events of that name&nbsp;&mdash; see the next section for details.


## Event Sources

Valid values of event sources include:

* `"accelerometer"`
* `"gyroscope"`
* `"heading"`
* `"inputDeviceStatus"`
* `"key"`
* `"location"`
* `"mouse"`
* `"multitouch"`
* `"orientation"`
* `"collision"`
* `"particleCollision"`
* `"preCollision"`
* `"postCollision"`


## Example

`````lua
local hasGyroscrope = system.hasEventSource( "gyroscope" )

if hasGyroscrope then
	print( "The device has a gyroscrope." )
end
`````
