# object:setCenter()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Map][api.type.Map]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setCenter
> __See also__          [object:setRegion()][api.type.Map.setRegion]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Moves the displayed map region to a new location, using the new center point but maintaining the zoom level. The final parameter is an optional boolean (default `false`) that determines whether the transition is animated or happens instantly.

## Syntax

	object:setCenter( latitude, longitude [, isAnimated] )

##### latitude ~^(required)^~
_[Number][api.type.Number]._ The latitude of the map's center point.

##### longitude ~^(required)^~
_[Number][api.type.Number]._ The longitude of the map's center point.

##### isAnimated ~^(optional)^~
_[Boolean][api.type.Boolean]._ Specifies whether the transition is animated (`true`) or happens instantly (`false`, the default).

## Example

``````lua
local myMap = native.newMapView( 0, 0, display.contentWidth, display.contentHeight )
myMap:setCenter( 37.331692, -122.030456 )
``````

