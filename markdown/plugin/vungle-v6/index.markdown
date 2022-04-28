# vungle.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The Vungle plugin offers easy integration of Vungle video ads.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This documentation is for the new Vungle Plugin(v6), click to view the [Vungle legacy plugin][plugin.vungle]

Notable changes from old plugin includes all [event.type][plugin.unityads-v4.event.adsRequest.type] name being changed and moved to [event.phase][plugin.unityads-v4.event.adsRequest.phase]. Also these events have been removed: `event.isAdPlayable`, `event.didDownload`, `event.completedView` and [vungle.init()][plugin.vungle-v6.init] has been simplified

</div>

## Registration

Using Vungle video ads requires a free account &mdash; please [register](https://dashboard.vungle.com/dashboard/) before proceeding.


## Functions

#### [vungle.init()][plugin.vungle-v6.init]

#### [vungle.load()][plugin.vungle-v6.load]

#### [vungle.show()][plugin.vungle-v6.show]

#### [vungle.isLoaded()][plugin.vungle-v6.isLoaded]

#### [vungle.setHasUserConsent()][plugin.vungle-v6.setHasUserConsent]

#### [vungle.getVersionString()][plugin.vungle-v6.getVersionString]


## Events

#### [adsRequest][plugin.vungle-v6.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.vungle.v6"] =
		{
			publisherId = "com.solar2d"
		},
	},
	iphone =
	 {
			 plist = {
					 NSUserTrackingUsageDescription = "This would allow the app to advertise better.",
					 SKAdNetworkItems = {
							 { SKAdNetworkIdentifier = "gta9lk7p23.skadnetwork" },
					 },
			 },
	 },
}
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`
* `"android.permission.ACCESS_NETWORK_STATE"`

</div>


## Support

* [Forums](https://forums.solar2d.com/c/solar2d/monetization-in-app-purchases-ads-etc/42)
* [https://v.vungle.com/](https://v.vungle.com)
