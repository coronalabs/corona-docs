# unityads.v4.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Unity Ads
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The Unity Ads plugin allows developers to monetize users through LevelPlay (Unity's mediation platform, powered by IronSource) video interstitial and rewarded video ads.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This plugin uses the **LevelPlay** backend (formerly IronSource). Click to view the [Unity Ads legacy plugin][plugin.unityads].

Notable changes from the legacy plugin:

* Ads must be loaded before showing via [unityads.load()][plugin.unityads-v4.load], which requires an **ad unit ID** (configured in the LevelPlay dashboard), not the old placement name.
* [unityads.load()][plugin.unityads-v4.load] accepts an optional `adType` parameter (`"rewarded"` for rewarded video; defaults to interstitial).
* The `placementStatus` [event.phase][plugin.unityads-v4.event.adsRequest.phase] has been removed.

Check out `setHasUserConsent` to enable manual GDPR data collection restrictions.

See more at the [LevelPlay privacy consent documentation](https://developers.is.com/ironsource-mobile/general/data-privacy-frameworks/).

</div>


## Registration

Before you can use this plugin, you must register and configure your app in the [LevelPlay dashboard](https://dashboard.is.com). Your **App Key** (used as `gameId`) and **Ad Unit IDs** are found there.


## Syntax

	local unityads = require( "plugin.unityads.v4" )


## Functions

#### [unityads.init()][plugin.unityads-v4.init]

#### [unityads.isLoaded()][plugin.unityads-v4.isLoaded]

#### [unityads.load()][plugin.unityads-v4.load]

#### [unityads.show()][plugin.unityads-v4.show]

#### [unityads.setHasUserConsent()][plugin.unityads-v4.setHasUserConsent]

#### [unityads.setPersonalizedAds()][plugin.unityads-v4.setPersonalizedAds]

#### [unityads.setPrivacyMode()][plugin.unityads-v4.setPrivacyMode]


## Events

#### [adsRequest][plugin.unityads-v4.event.adsRequest]


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
		["plugin.unityads.v4"] =
		{
			publisherId = "com.solar2d"
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
* `"com.google.android.gms.permission.AD_ID"`

Also, minimum Android API level required is 19

</div>


## Support

* [https://developers.is.com/](https://developers.is.com/)
* [Solar2D Forums](https://forums.solar2d.com/c/corona/monetization-in-app-purchases-ads-etc/)
