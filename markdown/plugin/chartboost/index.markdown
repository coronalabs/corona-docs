# chartboost.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Chartboost
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Chartboost plugin allows developers to monetize users through [Chartboost](https://www.chartboost.com) static interstitial, video interstitial, rewarded video ads, and more.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Check out new `hasUserConsent` init parameter to enable GDPR data collection restrictions.

</div>

## Registration

Before you can use this plugin, you must [register](https://www.chartboost.com ) with Chartboost.


## Syntax

	local chartboost = require( "plugin.chartboost" )


## Functions

#### [chartboost.init()][plugin.chartboost.init]

#### [chartboost.load()][plugin.chartboost.load]

#### [chartboost.isLoaded()][plugin.chartboost.isLoaded]

#### [chartboost.show()][plugin.chartboost.show]

#### [chartboost.onBackPressed()][plugin.chartboost.onBackPressed]


## Events

#### [adsRequest][plugin.chartboost.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	iphone =
	{
		plist = {
			NSUserTrackingUsageDescription = "This would allow the app to advertise better.",
			SKAdNetworkItems = {
				{ SKAdNetworkIdentifier = "2U9PT9HC89.skadnetwork" },
				{ SKAdNetworkIdentifier = "44jx6755aq.skadnetwork" },
				{ SKAdNetworkIdentifier = "4FZDC2EVR5.skadnetwork" },
				{ SKAdNetworkIdentifier = "4PFYVQ9L8R.skadnetwork" },
				{ SKAdNetworkIdentifier = "737z793b9f.skadnetwork" },
				{ SKAdNetworkIdentifier = "7UG5ZH24HU.skadnetwork" },
				{ SKAdNetworkIdentifier = "8s468mfl3y.skadnetwork" },
				{ SKAdNetworkIdentifier = "9RD848Q2BZ.skadnetwork" },
				{ SKAdNetworkIdentifier = "9T245VHMPL.skadnetwork" },
				{ SKAdNetworkIdentifier = "av6w8kgt66.skadnetwork" },
				{ SKAdNetworkIdentifier = "c6k4g5qg8m.skadnetwork" },
				{ SKAdNetworkIdentifier = "CJ5566H2GA.skadnetwork" },
				{ SKAdNetworkIdentifier = "F38H382JLK.skadnetwork" },
				{ SKAdNetworkIdentifier = "GLQZH8VGBY.skadnetwork" },
				{ SKAdNetworkIdentifier = "hs6bdukanm.skadnetwork" },
				{ SKAdNetworkIdentifier = "mlmmfzh3r3.skadnetwork" },
				{ SKAdNetworkIdentifier = "prcb7njmu6.skadnetwork" },
				{ SKAdNetworkIdentifier = "T38B2KH725.skadnetwork" },
				{ SKAdNetworkIdentifier = "TL55SBB4FM.skadnetwork" },
				{ SKAdNetworkIdentifier = "W9Q455WK68.skadnetwork" },
				{ SKAdNetworkIdentifier = "wg4vff78zm.skadnetwork" },
				{ SKAdNetworkIdentifier = "YCLNXRL5PM.skadnetwork" },
				{ SKAdNetworkIdentifier = "ydx93a7ass.skadnetwork" },
			},
		},
	},
	plugins =
	{
		["plugin.chartboost"] =
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
* `"android.permission.WRITE_EXTERNAL_STORAGE"`

In addition, you can add the following optional (but&nbsp;recommended) permissions:

* `"android.permission.ACCESS_WIFI_STATE"` &mdash; Allows the Chartboost SDK to check WiFi details and send the MAC address in the HTTP request. This will be used alongside the Android ID and/or GAID (where&nbsp;applicable) as the identifier for the user.

* `"android.permission.READ_PHONE_STATE"` &mdash; Allows the Chartboost SDK to handle calls interrupting video playback during videos.

</div>


## Support

* [https://answers.chartboost.com/](https://answers.chartboost.com/)
* [Forums](https://forums.solar2d.com/c/corona/monetization-in-app-purchases-ads-etc/42)
