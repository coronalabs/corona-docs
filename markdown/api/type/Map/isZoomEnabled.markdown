# object.isZoomEnabled

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [Map][api.type.Map]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          isZoomEnabled
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A boolean that determines whether users may use pinch/zoom gestures to zoom the map. Default is `true`. Set to `false` to prevent users from zooming the map. Note that a map can still be zoomed via the [object:setRegion()][api.type.Map.setRegion] function, even when this property is set to `false`.

## Example

``````lua
-- Do not allow the user to scroll and zoom the map.
myMap.isScrollEnabled = false
myMap.isZoomEnabled = false
``````
