
# event.cityDetail

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [mapAddress][api.event.mapAddress]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mapAddress, cityDetail
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Additional city information, such as neighborhood.

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
    print( "The  City Detail is: " .. event.cityDetail )
end
 
myMap:nearestAddress( 38.898748, -77.037684, mapAddressHandler )
``````
