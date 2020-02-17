# object:requestLocation()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Map][api.type.Map]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          requestLocation
> __See also__			[mapLocation][api.event.mapLocation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This is a replacement for the deprecated [object:getAddressLocation()][api.type.Map.getAddressLocation].

Returns the numerical latitude and longitude values of the given location string. The coordinates are returned as a [mapLocation][api.event.mapLocation] event. The coordinates can then be used to place a marker on the map, <nobr>re-center</nobr> the map to the desired location, or perform any of the other functions that use a latitude and longitude pair.

This function will accept virtually any address or intersection format as input, along with the names of some famous landmarks.


## Syntax

	object:requestLocation( location, resultHandler )

##### location ~^(required)^~
_[String][api.type.String]._ The address, intersection, or landmark.

##### resultHandler ~^(optional)^~
_[Listener][api.type.Listener]._ The listener function to be invoked for the [mapLocation][api.event.mapLocation] event.


## Gotchas

### Android

On Android, you must add the `INTERNET` permission to the `build.settings` file.

``````lua
settings =
{
   android =
   {
      usesPermissions =
      {
         "android.permission.INTERNET",
      },
   },
}
``````

### iOS

Starting with iOS 8, you must add the `NSLocationWhenInUseUsageDescription` key to the plist section of the `build.settings` file which contains the reason why you need access to location services.

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			NSLocationWhenInUseUsageDescription = "A description of why the app needs access to location services."
		},
	},
}
``````


## Example

``````lua
-- Create a native map view
local myMap = native.newMapView( 20, 20, 280, 360 )
myMap.x = display.contentCenterX
myMap.y = display.contentCenterY

local function locationHandler( event )

	if ( event.isError ) then
        print( "Map Error: " .. event.errorMessage )
    else
        print( "The specified string is at: " .. event.latitude .. "," .. event.longitude )
		myMap:setCenter( event.latitude, event.longitude )
    end

end

myMap:requestLocation( "1900 Embarcadero Road, Palo Alto, CA", locationHandler )
``````