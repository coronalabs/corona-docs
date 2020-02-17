# object:getUserLocation()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Map][api.type.Map]
> __Library__           [native.*][api.library.native]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          getUserLocation
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a [table][api.type.Table] containing values for the user's current location, including:

* `latitude` &mdash; The latitude in degrees of the current GPS location.

* `longitude` &mdash; The longitude in degrees of the current GPS location.

* `altitude` &mdash; The altitude in meters of the current GPS location.

* `accuracy` &mdash; The accuracy of the GPS location in meters. If negative, the latitude and longitude are not valid.

* `speed` &mdash; The instantaneous speed of the GPS device in meters per second. Divide the results by `0.447` to get MPH (miles&nbsp;per&nbsp;hour).

* `direction` &mdash; The direction the device is traveling in degrees clockwise from true north. If negative, the direction is invalid.

* `time` &mdash; Returns the UTC timestamp of the GPS location event. This is a <nobr>Unix-style</nobr> timestamp, expressed in seconds since <nobr>Jan. 1, 1970</nobr>.

* `errorCode` &mdash; A platform-specific integer for an error condition that is not language dependent. See [Error Handling](#errors) below for details.

* `errorMessage` &mdash; A string that describes an error in acquiring a GPS location from the device. See [Error Handling](#errors) below for details. The string may be localized according to the user's language.


## Syntax

	object:getUserLocation()


<a id="errors"></a>

## Error Handling

If the returned table's `errorCode` field is not `nil`, this indicates that the application has failed to fetch the user's current location. This can happen for the following reasons:

* Current location has not been received yet.
* Current location tracking is not available on the device.
* The application does not have permission.

The specific error codes (`errorCode`) and messages (`errorMessage`) are as follows:

<div class="inner-table">

 Code		Message / Description
----------	------------------------------
 `-3`		`"Current location is unknown"` &mdash; Occurs if location services is enabled but the device's location hardware is still activating.
 `-2`		`"Current location tracking is not available on this device"` &mdash; Occurs if this device doesn't have any means of determining the current location.
 `-1`		`"Location services are disabled"` &mdash; Occurs when the device can determine the current location, but the user has disabled location services.
 `0`		`"Pending user authorization"` &mdash; Occurs when the device is prompting the user for authorization to use location services.
 `1`		`"App is missing location permissions"` &mdash; Available on Android only. Occurs if neither `"android.permission.ACCESS_FINE_LOCATION"` nor `"android.permission.ACCESS_COARSE_LOCATION"` is defined in `build.settings`.
 `2`		`"Location is denied by user"` &mdash; On iOS, this occurs if the user has denied access to location data for the app. On Android&nbsp;6.0 and above, this occurs if the user has denied the app access to location data __and__ has requested that location permission is never requested again.
----------	------------------------------

</div>


## Gotchas

### Android

In order to retrieve current location on Android, you must set the following permissions in the `build.settings` file.

`````lua
settings =
{
    android =
    {
        usesPermissions =
        {
            -- Permission to retrieve current location from the GPS.
            "android.permission.ACCESS_FINE_LOCATION",

            -- Permission to retrieve current location from WiFi or cellular service.
            "android.permission.ACCESS_COARSE_LOCATION",
        },
    },
}
`````

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

local attempts = 0

local locationText = display.newText( "Location: ", 0, 400, native.systemFont, 16 )
locationText.anchorY = 0
locationText.x = display.contentCenterX

local function locationHandler( event )

	local currentLocation = myMap:getUserLocation()

	if ( currentLocation.errorCode or ( currentLocation.latitude == 0 and currentLocation.longitude == 0 ) ) then
		locationText.text = currentLocation.errorMessage

		attempts = attempts + 1

		if ( attempts > 10 ) then
			native.showAlert( "No GPS Signal", "Can't sync with GPS.", { "Okay" } )
		else
			timer.performWithDelay( 1000, locationHandler )
		end
	else
		locationText.text = "Current location: " .. currentLocation.latitude .. "," .. currentLocation.longitude
		myMap:setCenter( currentLocation.latitude, currentLocation.longitude )
		myMap:addMarker( currentLocation.latitude, currentLocation.longitude )
	end
end

locationHandler()
``````