
# event.isError

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.String]
> __Event__             [mapAddress][api.event.mapAddress]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mapAddress, isError
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates whether the reverse-geocoding server returned an error rather than a location.

Normally this will be `false`, but in the error case it will be `true` (and the other event attributes will be empty). [event.errorMessage][api.event.mapAddress.errorMessage] will contain a string describing the error.

## Example
 
``````lua
-- Create a native MapView (requires Xcode iOS Simulator build or device build)
-- You can create multiple maps, if you like...
local myMap = native.newMapView( 20, 20, 300, 220 )
myMap.mapType = "standard" -- other mapType options are "satellite" or "hybrid"
 
-- The MapView is just another Corona display object, and can be moved or rotated, etc.
myMap.x = display.contentWidth / 2
myMap.y = 120
 
-- Initialize map to a real location, since default location (0,0) is not very interesting
myMap:setCenter( 37.331692, -122.030456 )
 
local function mapAddressHandler( event )
    -- handle mapAddress event here
    if event.isError then
        print( "mapView Error: " .. event.errorMessage )
    else
        print( "The specified location is in: " .. event.city .. ", " .. event.country )
    end
end
 
myMap:nearestAddress( 38.898748, -77.037684, mapAddressHandler )
``````
