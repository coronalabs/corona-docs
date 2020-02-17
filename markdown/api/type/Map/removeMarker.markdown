# object:removeMarker()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Map][api.type.Map]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          removeMarker
> __See also__          [object:removeAllMarkers()][api.type.Map.removeAllMarkers]<br/>[object:addMarker()][api.type.Map.addMarker]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Clears a specific marker (pin) from the map.

## Syntax

	object:removeMarker( markerID )

##### markerID ~^(required)^~
_[Number][api.type.Number]._ The marker's identification number, for example the value returned from the  [object:addMarker()][api.type.Map.addMarker] function. 


## Example

``````lua
local myMap = native.newMapView( 0, 0, 300, 220 )
myMap.x = display.contentCenterX
myMap.y = display.contentCenterY

local options = { title="Displayed Title", subtitle="subtitle text" }
local markerID = myMap:addMarker( 37.331692, -122.030456, options )

--At some later time/event
myMap:removeMarker( markerID )
``````