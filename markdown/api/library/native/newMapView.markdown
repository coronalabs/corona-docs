
# native.newMapView()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      [Map][api.type.Map]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          maps, map view, map object
> __See also__          [mapAddress][api.event.mapAddress]
>						[mapLocation][api.event.mapLocation]
>						[mapMarker][api.event.mapMarker]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Renders a map view within the specified boundaries and returns a display object wrapper. On the map view, touch events are available when you add a [mapLocation][api.event.mapLocation] event listener.

## Gotchas

### General

* This feature is only supported on Android and iOS.

* Native map views are not part of the OpenGL canvas and do not obey the display object hierarchy, so they will always appear in front of normal display objects including images, text, and vector objects.

### Android

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-unlock-alt" style="font-size: 36px; margin-top: 2px; margin-left: 1px;"></div>
</div>
<div class="docs-tip-inner-right">

Google now requires you to provide an API key to use maps on Android. You can get an [API key here](https://developers.google.com/maps/documentation/javascript/get-api-key).

</div>
</div>

On Android, you must add the `INTERNET` permission to the `build.settings` file in order to display a map. You may optionally add location permissions in order to display the current location in a map.

``````lua
settings =
{
	android =
	{
		usesPermissions =
		{
			"android.permission.INTERNET",

			--optional permission used to display current location via the GPS
			"android.permission.ACCESS_FINE_LOCATION",

			--optional permission used to display current location via WiFi or cellular service
			"android.permission.ACCESS_COARSE_LOCATION",
		},
		usesFeatures =
		{
			-- If you set permissions "ACCESS_FINE_LOCATION" and "ACCESS_COARSE_LOCATION" above,
			-- you may want to set up your app to not require location services as follows.
			-- Otherwise, devices that do not have location sevices (such as a GPS) will be unable
			-- to purchase this app in the app store.
			{ name = "android.hardware.location", required = false },
			{ name = "android.hardware.location.gps", required = false },
			{ name = "android.hardware.location.network", required = false }
		},
	},
}
``````

In addition, you will need to add your API key to your `config.lua`:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,6,7,8,9]" }
application =
{
	license =
	{
		google =
		{
			mapsKey = "YOUR_MAPS_API_KEY",
		},
	},
}
``````
### iOS

On iOS, you must include the following keys/descriptions in the `plist` table of `build.settings`. When the system prompts the user to allow access, the associated description is displayed as part of the alert. Note that these descriptions can be customized to your preference and they can even be localized \([guide][guide.distribution.localization]\).

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			NSLocationAlwaysUsageDescription = "This app would like to use location services.",
			NSLocationWhenInUseUsageDescription = "This app would like to use location services.",
		},
	},
}
``````


## Syntax

	native.newMapView( x, y, width, height )

##### x ~^(required)^~
_[Number][api.type.Number]._ The __x__ coordinate that corresponds to the center of the map view object.

##### y ~^(required)^~
_[Number][api.type.Number]._ The __y__ coordinate that corresponds to the center of the map view object.

##### width ~^(required)^~
_[Number][api.type.Number]._ Width of the map view object.

##### height ~^(required)^~
_[Number][api.type.Number]._ Height of the map view object.


## Properties / Methods

See the [Map][api.type.Map] documentation for a list of methods and properties.


## Events

See the [mapAddress][api.event.mapAddress], [mapLocation][api.event.mapLocation], and [mapMarker][api.event.mapMarker] event documentation for properties related to various [Map][api.type.Map] object events.


## Example

`````lua
-- Create a native map view
local myMap = native.newMapView( 20, 20, 280, 360 )
myMap.x = display.contentCenterX
myMap.y = display.contentCenterY

-- Display map as vector drawings of streets (other options are "satellite" and "hybrid")
myMap.mapType = "standard"

-- Initialize map to a real location
myMap:setCenter( 37.331692, -122.030456 )
`````
