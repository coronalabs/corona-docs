
# orientation

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          orientation
> __See also__          [system.orientation][api.library.system.orientation]
>						[resize][api.event.resize]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Orientation events occur when the device orientation changes. This means that the orientation event will be triggered even for orientations that the app does not support, with a caveat for Android (see&nbsp;below).

Apps with a fixed orientation, for example `"portrait"` only, may use the orientation event to rotate the UI manually. However, for apps with multiple supported orientations, the orientation event should __not__ be used to re-layout the UI &mdash; instead, the [resize][api.event.resize] event should be used.

This event is also helpful if you're using [accelerometer][api.event.accelerometer] or [gyroscope][api.event.gyroscope] data. This data is relative to portrait orientation, so you can use orientation events to handle the data based on the device's current orientation.

## Gotchas

* On Android, if your app only supports __one__ orientation in `build.settings`, the orientation event will still be triggered for __all__ device orientations. However, if your app supports two or more orientations, the orientation event will only be triggered only for the app's __supported__ orientations.

* There is a limitation in the Android OS where it will never report an orientation event when flipping between `"landscapeRight"` and `"landscapeLeft"`, nor will it be reported between `"portrait"` and `"portraitUpsideDown"`.


## Properties

#### [event.type][api.event.orientation.type]

#### [event.name][api.event.orientation.name]

#### [event.delta][api.event.orientation.delta]

## Example

``````lua
local function onOrientationChange( event )
    local currentOrientation = event.type
    print( "Current orientation: " .. currentOrientation )
end
 
Runtime:addEventListener( "orientation", onOrientationChange )
``````
