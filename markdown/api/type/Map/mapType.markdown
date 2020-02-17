# object.mapType

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [Map][api.type.Map]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mapType
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string that specifies the type of map display. Possible values are:

* `"standard"` (default)
* `"satellite"`
* `"hybrid"`

## Example

``````lua
local myMap = native.newMapView( 0, 0 , display.contentWidth, display.contentHeight )
myMap.mapType = "satellite"
``````