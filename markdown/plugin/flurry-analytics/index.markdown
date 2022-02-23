# flurryAnalytics.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Flurry Analytics
> __Platforms__			Android, iOS
> __Sample__			[https://github.com/coronalabs/plugins-sample-flurry-analytics](https://github.com/coronalabs/plugins-sample-flurry-analytics)
> --------------------- ------------------------------------------------------------------------------------------


## Overview


The Flurry Analytics plugin allows you to track the usage and behavior of your application in the [Flurry](https://dev.flurry.com/) system. Optional crash analytics are also available which allow you to monitor system crashes and unhandled events.


## Syntax

	local flurryAnalytics = require( "plugin.flurry.analytics" )


## Functions

#### [flurryAnalytics.init()][plugin.flurry-analytics.init]

#### [flurryAnalytics.logEvent()][plugin.flurry-analytics.logEvent]

#### [flurryAnalytics.startTimedEvent()][plugin.flurry-analytics.startTimedEvent]

#### [flurryAnalytics.endTimedEvent()][plugin.flurry-analytics.endTimedEvent]


## Events

#### [analyticsRequest][plugin.flurry-analytics.event.analyticsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.flurry.analytics"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`
* `"android.permission.ACCESS_NETWORK_STATE"`

In addition, you can optionally include the `"android.permission.ACCESS_FINE_LOCATION"` and `"android.permission.ACCESS_COARSE_LOCATION"` permissions. This allows Flurry to record the end user's current location such as latitude and longitude. If you do not set these location permissions, Flurry can only record the country that the app was used in, based on the device's locale and region settings. Note that if you add these location permissions, you should __not__ require device features like GPS, as doing so may prevent downloading of the app on a device without these features.

</div>
