# analytics.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [analytics.*][api.library.analytics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Flurry
> __See also__          [analytics.logEvent()][plugin.flurry.logEvent]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initializes the Flurry analytics library. Once initialized, use [analytics.logEvent()][plugin.flurry.logEvent] to log events.


## Syntax

	analytics.init( apiKey )

##### apiKey ~^(required)^~
_[String][api.type.String]._ The API key provided by Flurry &mdash; see the next section for details.


## API Key

To get the `apiKey` value, register for an account with [Flurry](http://www.flurry.com). Once you've logged into the Flurry dashboard, go to __Manage&nbsp;Applications__. From there, click <nobr>__Create a new app__</nobr>, then choose __iPhone__, __iPad__, or __Android__ as appropriate. This will create the application key.


## Gotchas

### Android

On Android, you must set the `INTERNET` permission within the `build.settings` file to record and send analytics data.

You may optionally set the `ACCESS_FINE_LOCATION` and `ACCESS_COARSE_LOCATION` permissions if you want Flurry to record the end user's current location such as latitude and longitude. If you do not set these location permissions, Flurry can only record the country that the app was used in, based on the device's locale and region settings. Note that if you add these location permissions, you should __not__ require device features like GPS, as doing so may prevent downloading of the app on a device without these features.

``````lua
settings =
{
	android =
	{
		usesPermissions =
		{
			"android.permission.INTERNET",
			-- The following permissions are optional.
			-- If set, Flurry will also record current location via GPS and/or WiFi.
			-- If not set, Flurry can only record which country the app was used in.
			"android.permission.ACCESS_FINE_LOCATION",    --fetches location via GPS
			"android.permission.ACCESS_COARSE_LOCATION",  --fetches location via WiFi or cellular service
		},
		usesFeatures =
		{
			-- If you set permissions "ACCESS_FINE_LOCATION" and "ACCESS_COARSE_LOCATION" above,
			-- you should set the app to NOT require location services:
			{ name="android.hardware.location", required=false },
			{ name="android.hardware.location.gps", required=false },
			{ name="android.hardware.location.network", required=false },
		},
	},
}
``````

## Example

``````lua
local analytics = require( "analytics" )

-- initialize with proper API key corresponding to your application
analytics.init( "API_KEY" )

-- log events
analytics.logEvent( "Event" )
``````