# unityads.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Unity Ads
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The Unity Ads plugin allows developers to monetize users through Unity Ads video interstitial and rewarded video ads.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

On a per-app basis, the first time a Unity ad appears, the user will see a banner with the option to opt-out of behaviorally targeted advertising. Thereafter, the user can click an information button to receive the opt-out again.

Although UnityAds will automatically present users with an opportunity to opt-out of targeted advertising, with no implementation needed from the publisher, check out new `setHasUserConsent` method to enable manual GDPR data collection restrictions.

See more at [Unity Ads GDPR Compliance doc page](https://unityads.unity3d.com/help/legal/gdpr)

</div>


## Registration

Before you can use this plugin, you must [register](https://unity3d.com/services/ads) with Unity&nbsp;Ads.


## Syntax

	local unityads = require( "plugin.unityads" )


## Functions

#### [unityads.init()][plugin.unityads.init]

#### [unityads.isLoaded()][plugin.unityads.isLoaded]

#### [unityads.show()][plugin.unityads.show]

#### [unityads.setHasUserConsent()][plugin.unityads.setHasUserConsent]


## Events

#### [adsRequest][plugin.unityads.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.&nbsp;

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			NSUserTrackingUsageDescription = "Your data will be used to provide you a better and personalized ad experience.",
			SKAdNetworkItems = {
				{ SKAdNetworkIdentifier = "4dzt52r2t5.skadnetwork" },
				{ SKAdNetworkIdentifier = "bvpn9ufa9b.skadnetwork" },
			},
		},
	},
	android =
	{
		minSdkVersion = "19",
	},
	plugins =
	{
		["plugin.unityads"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If you are building for Android, you should __remove__ any legacy inclusion of the `["plugin.google.play.services"]` plugin from your `build.settings`.

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`
* `"android.permission.ACCESS_NETWORK_STATE"`

Also, minimum Android API level required is 19

</div>


## Support

* [https://unity3d.com/services/ads](https://unity3d.com/services/ads)
* [Solar2D Forums](https://forums.solar2d.com/c/corona/monetization-in-app-purchases-ads-etc/)
