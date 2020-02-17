# object.isScrollEnabled

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [Map][api.type.Map]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          isScrollEnabled
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A Boolean that determines whether users can scroll the map by hand. Default is `true`. Set to `false` to prevent users from scrolling the map. Note that a map can still be scrolled/panned via the [object:setCenter()][api.type.Map.setCenter] and [object:setRegion()][api.type.Map.setRegion] functions, even if this property is `false`. This is useful if you want map movement to be controlled by the program, not the user.

## Example

``````lua
-- Do not allow the user to scroll and zoom the map.
myMap.isScrollEnabled = false
myMap.isZoomEnabled = false
``````
