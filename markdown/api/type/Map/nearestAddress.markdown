# object:nearestAddress()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Map][api.type.Map]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          nearestAddress
> __See also__			[mapAddress][api.event.mapAddress]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the nearest address based on the given latitude and longitude values, returned as a [mapAddress][api.event.mapAddress] event.


## Syntax

	object:nearestAddress( latitude, longitude, resultHandler )

##### latitude ~^(required)^~
_[Number][api.type.Number]._ The latitude in degrees of the desired location.

##### longitude ~^(required)^~
_[Number][api.type.Number]._ The longitude in degrees of the desired location.

##### resultHandler ~^(optional)^~
_[Listener][api.type.Listener]._ The listener function to be invoked for the [mapAddress][api.event.mapAddress] event.


## Gotchas

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
        print( "Nearest location: " .. event.city .. ", " .. event.country )
    end

end

-- Initialize map to a real location
myMap:setCenter( 37.331692, -122.030456 )

myMap:nearestAddress( 38.898748, -77.037684, locationHandler )
``````