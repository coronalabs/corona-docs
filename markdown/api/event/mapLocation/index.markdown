
# mapLocation

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mapLocation
> __See also__          [map:requestLocation()][api.type.Map.requestLocation]
>						[map:getUserLocation()][api.type.Map.getUserLocation]
>						[mapAddress][api.event.mapAddress]
>						[mapMarker][api.event.mapMarker]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The `mapLocation` event is generated asynchronously in response to calling [map:requestLocation()][api.type.Map.requestLocation] or in response to a tap event on the [Map][api.type.Map].


## Gotchas

* On devices, `mapLocation` events may be delayed by activation of the device's location hardware. See [map:getUserLocation()][api.type.Map.getUserLocation] for details.

* This event is not available in the Corona Simulator.


## Properties

#### [event.errorMessage][api.event.mapLocation.errorMessage]

#### [event.isError][api.event.mapLocation.isError]

#### [event.name][api.event.mapLocation.name]

#### [event.latitude][api.event.mapLocation.latitude]

#### [event.longitude][api.event.mapLocation.longitude]

#### [event.request][api.event.mapLocation.request]

#### [event.type][api.event.mapLocation.type]


## Example

``````lua
local function mapLocationListener( event )
	print( "The tapped location is in: " .. event.latitude .. ", " .. event.longitude )
end

-- Create a native map view
local myMap = native.newMapView( 20, 20, 300, 220 )

-- Initialize map to a real location since default location (0,0) is not very interesting
myMap:setCenter( 37.331692, -122.030456 )
myMap:addEventListener( "mapLocation", mapLocationListener )
``````
