# object:addMarker()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Map][api.type.Map]
> __Library__           [native.*][api.library.native]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          addMarker
> __See also__          [object:removeMarker()][api.type.Map.removeMarker]
>						[object:removeAllMarkers()][api.type.Map.removeAllMarkers]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Adds a pin to the map at the specified location. The optional title and subtitle will appear on a small popup when the pin is touched.  If a custom image is specified then the bottom center of the image will be the pinned location.

This function returns an identification number for the marker added, or `nil` if there was a failure. This number can be used along with [object:removeMarker()][api.type.Map.removeMarker] to remove a marker.


## Gotchas

On devices, `object:addMarker()` may need to be delayed until activation of the device's location hardware. One solution is to repeatedly queue the location hardware until it receives a proper response, then call this function. See&nbsp;the example in [object:getUserLocation()][api.type.Map.getUserLocation] for details.


## Syntax

	object:addMarker( latitude, longitude )
	object:addMarker( latitude, longitude, options )

##### latitude ~^(required)^~
_[Number][api.type.Number]._ The marker's latitude in degrees.

##### longitude ~^(required)^~
_[Number][api.type.Number]._ The marker's longitude in degrees.

##### options ~^(optional)^~
_[Table][api.type.Table]._ A table of options for the marker — see the next section for details.


## Options Reference

##### title ~^(optional)^~
_[String][api.type.String]._ The title to display on the popup that appears when the user taps the marker.

##### subtitle ~^(optional)^~
_[String][api.type.String]._ The subtitle to display on the popup that appears when the user taps the marker.

##### listener ~^(optional)^~
_[Function][api.type.Function]._ The listener that will be called when the marker is tapped.

##### imageFile ~^(optional)^~
_[String][api.type.String]._ The file name of the image to be used for the marker. The default base directory is the resource directory. It can also be a [table][api.type.Table] of the form <nobr>`{ baseDir=, filename= }`</nobr>. This will use dynamic image selection. The coordinates are returned as a [mapMarker][api.event.mapMarker].


## Example

``````lua
-- Map marker listener function
local function markerListener(event)
    print( "type: ", event.type )  -- event type
    print( "markerId: ", event.markerId )  -- ID of the marker that was touched
    print( "lat: ", event.latitude )  -- latitude of the marker
    print( "long: ", event.longitude )  -- longitude of the marker
end

-- Create a native map view
local myMap = native.newMapView( 0, 0, 300, 220 )
myMap.x = display.contentCenterX
myMap.y = display.contentCenterY

-- Sometime later (following activation of device location hardware)
local options = 
{ 
    title = "Displayed Title", 
    subtitle = "Subtitle text", 
    listener = markerListener,
	-- This will look in the resources directory for the image file
    imageFile =  "someImage.png",
	-- Alternatively, this looks in the specified directory for the image file
	-- imageFile = { filename="someImage.png", baseDir=system.TemporaryDirectory }
}
local result, errorMessage = myMap:addMarker( 37.331692, -122.030456, options )
if ( result ) then
    print( "Marker added" )
else
    print( errorMessage )
end
``````
