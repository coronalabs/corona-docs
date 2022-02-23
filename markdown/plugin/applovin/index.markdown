# applovin.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Library][api.type.Library]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			ads, advertising, AppLovin
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

<!---

<div class="float-right" style="max-width: 240px; clear: both;">

![][images.docs.plugin-screenshot-applovin]

</div>

-->

The AppLovin plugin allows developers to monetize users through [AppLovin](https://www.applovin.com/) static interstitial, video interstitial, and rewarded video ads.


<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

This documentation outlines the legacy AppLovin plugin, primarily intended for iOS and Android that use the old api and non-Max(aka non-mediation) in their apps.

</div>
</div>

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* Once you are [registered](https://www.applovin.com/signup), obtain your __SDK&nbsp;key__ from the [AppLovin developer portal](https://www.applovin.com/manage). From the __Account__ section, expand the __Account__ menu on the left side, select __Keys__, and your SDK key should be revealed.

* Native ads are not supported at this time.

* Apps are automatically added to the [AppLovin developer portal](https://www.applovin.com/manage) when you [include](#settings) this plugin within your project, `require()`&nbsp;it, and call [applovin.init()][plugin.applovin.init].

* If you use the plugin and make changes to the ad settings in the [AppLovin developer portal](https://www.applovin.com/manage), you must also email [support@solar2d.com](mailto:support@solar2d.com) with a summary of your changes. This ensures that your ads and associated preferences will be delivered consistently.

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Check out new `setHasUserConsent` method to enable GDPR data collection restrictions.

</div>

## Registration

To begin, please register with [AppLovin](https://www.applovin.com/signup). Once you have access to the [AppLovin developer portal](https://www.applovin.com/manage), you can view your apps, select ad preferences, and more.


## Syntax

<div id="example">

##### AppLovin

	local applovin = require( "plugin.applovin" )

</div>


## Functions

#### [applovin.init()][plugin.applovin.init]

#### [applovin.load()][plugin.applovin.load]

#### [applovin.isLoaded()][plugin.applovin.isLoaded]

#### [applovin.show()][plugin.applovin.show]

#### [applovin.setUserDetails()][plugin.applovin.setUserDetails]

#### [applovin.hide()][plugin.applovin.hide]

#### [applovin.setHasUserConsent()][plugin.applovin.setHasUserConsent]

#### [applovin.setIsAgeRestrictedUser()][plugin.applovin.setIsAgeRestrictedUser]


## Events

#### [adsRequest][plugin.applovin.event.adsRequest]


<a id="settings"></a>

## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

<div id="example">

##### AppLovin

``````{ brush="lua" gutter="false" first-line="1" }
settings =
{
	iphone =
	{
		plist =
		{
			NSUserTrackingUsageDescription = "This only uses device info for less annoying, more relevant ads.",
			SKAdNetworkItems = {
				{ SKAdNetworkIdentifier = "24t9a8vw3c.skadnetwork" },
					{ SKAdNetworkIdentifier = "275upjj5gd.skadnetwork" },
					{ SKAdNetworkIdentifier = "294l99pt4k.skadnetwork" },
					{ SKAdNetworkIdentifier = "2fnua5tdw4.skadnetwork" },
					{ SKAdNetworkIdentifier = "2u9pt9hc89.skadnetwork" },
					{ SKAdNetworkIdentifier = "32z4fx6l9h.skadnetwork" },
					{ SKAdNetworkIdentifier = "3qcr597p9d.skadnetwork" },
					{ SKAdNetworkIdentifier = "3rd42ekr43.skadnetwork" },
					{ SKAdNetworkIdentifier = "3sh42y64q3.skadnetwork" },
					{ SKAdNetworkIdentifier = "424m5254lk.skadnetwork" },
					{ SKAdNetworkIdentifier = "4468km3ulz.skadnetwork" },
					{ SKAdNetworkIdentifier = "4fzdc2evr5.skadnetwork" },
					{ SKAdNetworkIdentifier = "4pfyvq9l8r.skadnetwork" },
					{ SKAdNetworkIdentifier = "523jb4fst2.skadnetwork" },
					{ SKAdNetworkIdentifier = "54nzkqm89y.skadnetwork" },
					{ SKAdNetworkIdentifier = "578prtvx9j.skadnetwork" },
					{ SKAdNetworkIdentifier = "5a6flpkh64.skadnetwork" },
					{ SKAdNetworkIdentifier = "5l3tpt7t6e.skadnetwork" },
					{ SKAdNetworkIdentifier = "5lm9lj6jb7.skadnetwork" },
					{ SKAdNetworkIdentifier = "6xzpu9s2p8.skadnetwork" },
					{ SKAdNetworkIdentifier = "79pbpufp6p.skadnetwork" },
					{ SKAdNetworkIdentifier = "7rz58n8ntl.skadnetwork" },
					{ SKAdNetworkIdentifier = "7ug5zh24hu.skadnetwork" },
					{ SKAdNetworkIdentifier = "8s468mfl3y.skadnetwork" },
					{ SKAdNetworkIdentifier = "9b89h5y424.skadnetwork" },
					{ SKAdNetworkIdentifier = "9nlqeag3gk.skadnetwork" },
					{ SKAdNetworkIdentifier = "9rd848q2bz.skadnetwork" },
					{ SKAdNetworkIdentifier = "9t245vhmpl.skadnetwork" },
					{ SKAdNetworkIdentifier = "av6w8kgt66.skadnetwork" },
					{ SKAdNetworkIdentifier = "c6k4g5qg8m.skadnetwork" },
					{ SKAdNetworkIdentifier = "cg4yq2srnc.skadnetwork" },
					{ SKAdNetworkIdentifier = "cj5566h2ga.skadnetwork" },
					{ SKAdNetworkIdentifier = "cstr6suwn9.skadnetwork" },
					{ SKAdNetworkIdentifier = "e5fvkxwrpn.skadnetwork" },
					{ SKAdNetworkIdentifier = "ejvt5qm6ak.skadnetwork" },
					{ SKAdNetworkIdentifier = "f38h382jlk.skadnetwork" },
					{ SKAdNetworkIdentifier = "feyaarzu9v.skadnetwork" },
					{ SKAdNetworkIdentifier = "g28c52eehv.skadnetwork" },
					{ SKAdNetworkIdentifier = "ggvn48r87g.skadnetwork" },
					{ SKAdNetworkIdentifier = "glqzh8vgby.skadnetwork" },
					{ SKAdNetworkIdentifier = "gta9lk7p23.skadnetwork" },
					{ SKAdNetworkIdentifier = "hs6bdukanm.skadnetwork" },
					{ SKAdNetworkIdentifier = "k674qkevps.skadnetwork" },
					{ SKAdNetworkIdentifier = "kbd757ywx3.skadnetwork" },
					{ SKAdNetworkIdentifier = "kbmxgpxpgc.skadnetwork" },
					{ SKAdNetworkIdentifier = "klf5c3l5u5.skadnetwork" },
					{ SKAdNetworkIdentifier = "ludvb6z3bs.skadnetwork" },
					{ SKAdNetworkIdentifier = "m8dbw4sv7c.skadnetwork" },
					{ SKAdNetworkIdentifier = "mlmmfzh3r3.skadnetwork" },
					{ SKAdNetworkIdentifier = "mtkv5xtk9e.skadnetwork" },
					{ SKAdNetworkIdentifier = "n6fk4nfna4.skadnetwork" },
					{ SKAdNetworkIdentifier = "n9x2a789qt.skadnetwork" },
					{ SKAdNetworkIdentifier = "p78axxw29g.skadnetwork" },
					{ SKAdNetworkIdentifier = "ppxm28t8ap.skadnetwork" },
					{ SKAdNetworkIdentifier = "prcb7njmu6.skadnetwork" },
					{ SKAdNetworkIdentifier = "pwa73g5rt2.skadnetwork" },
					{ SKAdNetworkIdentifier = "qqp299437r.skadnetwork" },
					{ SKAdNetworkIdentifier = "r45fhb6rf7.skadnetwork" },
					{ SKAdNetworkIdentifier = "rvh3l7un93.skadnetwork" },
					{ SKAdNetworkIdentifier = "t38b2kh725.skadnetwork" },
					{ SKAdNetworkIdentifier = "tl55sbb4fm.skadnetwork" },
					{ SKAdNetworkIdentifier = "uw77j35x4d.skadnetwork" },
					{ SKAdNetworkIdentifier = "v72qych5uu.skadnetwork" },
					{ SKAdNetworkIdentifier = "wg4vff78zm.skadnetwork" },
					{ SKAdNetworkIdentifier = "wzmmz9fp6w.skadnetwork" },
					{ SKAdNetworkIdentifier = "x8jxxk4ff5.skadnetwork" },
					{ SKAdNetworkIdentifier = "xy9t38ct57.skadnetwork" },
					{ SKAdNetworkIdentifier = "yclnxrl5pm.skadnetwork" },
					{ SKAdNetworkIdentifier = "ydx93a7ass.skadnetwork" },
					{ SKAdNetworkIdentifier = "zmvfpc5aq8.skadnetwork" },
			}
		},
	},
	plugins =
	{
		["plugin.applovin"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`
* `"android.permission.ACCESS_NETWORK_STATE"`
* `"android.permission.WRITE_EXTERNAL_STORAGE"`

</div>

## Sample project

* [View on GitHub](https://github.com/coronalabs/plugins-sample-applovin)
