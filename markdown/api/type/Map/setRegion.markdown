# object:setRegion()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Map][api.type.Map]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setRegion
> __See also__          [object:setCenter()][api.type.Map.setCenter]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Moves the displayed map region to a new location, with the new center point and horizontal/vertical span distances given in degrees of latitude and longitude. This implicitly sets the zoom level. This function will "sanity-check" the span settings and will interpolate a consistent zoom level even if `latitudeSpan` and `longitudeSpan` are specified with radically different values. The final parameter is an optional boolean (default `false`) that determines whether the transition is animated or happens instantly.

Note that degrees of latitude and longitude cover large distances on the Earth, so fairly small changes will translate into big position changes in the map, especially at close zoom levels. Also note that most of the planet's map locations are fairly empty, so it will generally be easier to work with known latitude/longitude values when experimenting with maps. Try looking up your own address on a site like [Google Maps](https://www.google.com/maps) if you need a quick test location.

## Syntax

	object:setRegion( latitude, longitude, latitudeSpan, longitudeSpan [, isAnimated] )
	
##### latitude ~^(required)^~
_[Number][api.type.Number]._ The latitude of the region's center point.

##### longitude ~^(required)^~
_[Number][api.type.Number]._ The longitude of the region's center point.

##### latitudeSpan ~^(required)^~
_[Number][api.type.Number]._ The region's latitudinal span in degrees. This implicitly sets the map's zoom level.

##### longitudeSpan ~^(required)^~
_[Number][api.type.Number]._ The region's longitudinal span in degrees. This implicitly sets the map's zoom level.

##### isAnimated ~^(optional)^~
_[Boolean][api.type.Boolean]._ Specifies whether to animate the map from the current region to the new one. Default is `false`.

## Example

``````lua
local myMap = native.newMapView( 0, 0, display.contentWidth, display.contentHeight )
myMap:setRegion( 37.331692, -122.030456, 0.01, 0.01, false )
``````