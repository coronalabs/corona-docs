# appodeal.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appodeal
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The Appodeal plugin allows developers to monetize their mobile app with Appodeal banner, static interstitial, video interstitial, and rewarded video ads.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Be warned that plugin builds for Amazon store are restricted at the moment. We are working on the appropriate SDK/plugin update and the ability to publish your apps, which includes Appodeal modular plugin, to Amazon store should become available as soon as possible.

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Appodeal contains various SDKs for the ad providers it mediates. This means that you can __not__ use Appodeal in conjunction with [AdColony][plugin.adcolony], [AppLovin][plugin.applovin], [AdMob][plugin.admob], [Chartboost][plugin.chartboost], [Facebook Audience Network][plugin.fbAudienceNetwork], [Flurry Analytics][plugin.flurry-analytics], [InMobi][plugin.inmobi], [Unity Ads][plugin.unityads], or [Vungle][plugin.vungle].

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Beta version of Appodeal plugin is now available! Check latest note in Project Settings section to learn more.

#### Version info
Current plugin versions are:

* Stable plugins is `3.0.2` for both Android and iOS. The Beta plugin is on `3.2.0-beta.1`

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Check out new `hasUserConsent` init parameter to enable GDPR data collection restrictions.

</div>


## Registration

Before you can use this plugin, you must [register](https://www.appodeal.com/signup) with Appodeal.


## Syntax

	local appodeal = require( "plugin.appodeal" )


## Functions

#### [appodeal.init()][plugin.appodeal.init]

#### [appodeal.show()][plugin.appodeal.show]

#### [appodeal.hide()][plugin.appodeal.hide]

#### [appodeal.load()][plugin.appodeal.load]

#### [appodeal.isLoaded()][plugin.appodeal.isLoaded]

#### [appodeal.setUserDetails()][plugin.appodeal.setUserDetails]

#### [appodeal.getRewardParameters()][plugin.appodeal.getRewardParameters]

#### [appodeal.getVersion()][plugin.appodeal.getVersion]

#### [appodeal.setSegmentFilter()][plugin.appodeal.setSegmentFilter]

#### [appodeal.canShow()][plugin.appodeal.canShow]

#### [appodeal.trackInAppPurchase()][plugin.appodeal.trackInAppPurchase]

#### [appodeal.set728x90Banners()][plugin.appodeal.set728x90Banners]


## Events

#### [adsRequest][plugin.appodeal.event.adsRequest]


## Project Settings

To use this plugin in modular mode, your `plugins` table of `build.settings` should look like this:

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			GADApplicationIdentifier = "[YOUR_ADMOB_APP_ID]", -- replace with your app id. See: https://googlemobileadssdk.page.link/admob-ios-update-plist
			NSAppTransportSecurity = { NSAllowsArbitraryLoads=true },
			MinimumOSVersion = "10.0", -- Needed to avoid build errors
			NSLocationWhenInUseUsageDescription = "The app needs your location for analytics and advertising purposes",
			NSCalendarsUsageDescription = "The app needs your calendar to provide personalised advertising experience tailored to you",
			NSUserTrackingUsageDescription = "This identifier will be used to deliver personalized ads to you.",
			SKAdNetworkItems = {
					 { SKAdNetworkIdentifier = "4pfyvq9l8r.skadnetwork" },
					 { SKAdNetworkIdentifier = "6g9af3uyq4.skadnetwork" },
					 { SKAdNetworkIdentifier = "4fzdc2evr5.skadnetwork" },
					 { SKAdNetworkIdentifier = "2fnua5tdw4.skadnetwork" },
					 { SKAdNetworkIdentifier = "ydx93a7ass.skadnetwork" },
					 { SKAdNetworkIdentifier = "cg4yq2srnc.skadnetwork" },
					 { SKAdNetworkIdentifier = "v72qych5uu.skadnetwork" },
					 { SKAdNetworkIdentifier = "mlmmfzh3r3.skadnetwork" },
					 { SKAdNetworkIdentifier = "pwdxu55a5a.skadnetwork" },
					 { SKAdNetworkIdentifier = "c6k4g5qg8m.skadnetwork" },
					 { SKAdNetworkIdentifier = "wg4vff78zm.skadnetwork" },
					 { SKAdNetworkIdentifier = "g28c52eehv.skadnetwork" },
					 { SKAdNetworkIdentifier = "523jb4fst2.skadnetwork" },
					 { SKAdNetworkIdentifier = "294l99pt4k.skadnetwork" },
					 { SKAdNetworkIdentifier = "hs6bdukanm.skadnetwork" },
					 { SKAdNetworkIdentifier = "prcb7njmu6.skadnetwork" },
					 { SKAdNetworkIdentifier = "m8dbw4sv7c.skadnetwork" },
					 { SKAdNetworkIdentifier = "9nlqeag3gk.skadnetwork" },
					 { SKAdNetworkIdentifier = "cj5566h2ga.skadnetwork" },
					 { SKAdNetworkIdentifier = "u679fj5vs4.skadnetwork" },
					 { SKAdNetworkIdentifier = "a7xqa6mtl2.skadnetwork" },
					 { SKAdNetworkIdentifier = "g2y4y55b64.skadnetwork" },
					 { SKAdNetworkIdentifier = "wzmmz9fp6w.skadnetwork" },
					 { SKAdNetworkIdentifier = "yclnxrl5pm.skadnetwork" },
					 { SKAdNetworkIdentifier = "4468km3ulz.skadnetwork" },
					 { SKAdNetworkIdentifier = "t38b2kh725.skadnetwork" },
					 { SKAdNetworkIdentifier = "7ug5zh24hu.skadnetwork" },
					 { SKAdNetworkIdentifier = "rx5hdcabgc.skadnetwork" },
					 { SKAdNetworkIdentifier = "5lm9lj6jb7.skadnetwork" },
					 { SKAdNetworkIdentifier = "9rd848q2bz.skadnetwork" },
					 { SKAdNetworkIdentifier = "n6fk4nfna4.skadnetwork" },
					 { SKAdNetworkIdentifier = "7rz58n8ntl.skadnetwork" },
					 { SKAdNetworkIdentifier = "ejvt5qm6ak.skadnetwork" },
					 { SKAdNetworkIdentifier = "275upjj5gd.skadnetwork" },
					 { SKAdNetworkIdentifier = "kbd757ywx3.skadnetwork" },
					 { SKAdNetworkIdentifier = "9t245vhmpl.skadnetwork" },
					 { SKAdNetworkIdentifier = "n9x2a789qt.skadnetwork" },
					 { SKAdNetworkIdentifier = "44jx6755aq.skadnetwork" },
					 { SKAdNetworkIdentifier = "tl55sbb4fm.skadnetwork" },
					 { SKAdNetworkIdentifier = "2u9pt9hc89.skadnetwork" },
					 { SKAdNetworkIdentifier = "8s468mfl3y.skadnetwork" },
					 { SKAdNetworkIdentifier = "klf5c3l5u5.skadnetwork" },
					 { SKAdNetworkIdentifier = "ppxm28t8ap.skadnetwork" },
					 { SKAdNetworkIdentifier = "74b6s63p6l.skadnetwork" },
					 { SKAdNetworkIdentifier = "kbmxgpxpgc.skadnetwork" },
					 { SKAdNetworkIdentifier = "44n7hlldy6.skadnetwork" },
					 { SKAdNetworkIdentifier = "5l3tpt7t6e.skadnetwork" },
					 { SKAdNetworkIdentifier = "uw77j35x4d.skadnetwork" },
					 { SKAdNetworkIdentifier = "6964rsfnh4.skadnetwork" },
					 { SKAdNetworkIdentifier = "84993kbrcf.skadnetwork" },
					 { SKAdNetworkIdentifier = "pwa73g5rt2.skadnetwork" },
					 { SKAdNetworkIdentifier = "mtkv5xtk9e.skadnetwork" },
					 { SKAdNetworkIdentifier = "e5fvkxwrpn.skadnetwork" },
					 { SKAdNetworkIdentifier = "gta9lk7p23.skadnetwork" },
					 { SKAdNetworkIdentifier = "r45fhb6rf7.skadnetwork" },
					 { SKAdNetworkIdentifier = "3rd42ekr43.skadnetwork" },
					 { SKAdNetworkIdentifier = "ludvb6z3bs.skadnetwork" },
					 { SKAdNetworkIdentifier = "737z793b9f.skadnetwork" },
					 { SKAdNetworkIdentifier = "mls7yz5dvl.skadnetwork" },
					 { SKAdNetworkIdentifier = "w9q455wk68.skadnetwork" },
					 { SKAdNetworkIdentifier = "p78axxw29g.skadnetwork" },
					 { SKAdNetworkIdentifier = "6xzpu9s2p8.skadnetwork" },
					 { SKAdNetworkIdentifier = "ggvn48r87g.skadnetwork" },
					 { SKAdNetworkIdentifier = "3sh42y64q3.skadnetwork" },
					 { SKAdNetworkIdentifier = "f38h382jlk.skadnetwork" },
					 { SKAdNetworkIdentifier = "24t9a8vw3c.skadnetwork" },
					 { SKAdNetworkIdentifier = "cstr6suwn9.skadnetwork" },
					 { SKAdNetworkIdentifier = "zmvfpc5aq8.skadnetwork" },
					 { SKAdNetworkIdentifier = "feyaarzu9v.skadnetwork" },
					 { SKAdNetworkIdentifier = "5a6flpkh64.skadnetwork" },
					 { SKAdNetworkIdentifier = "glqzh8vgby.skadnetwork" },
					 { SKAdNetworkIdentifier = "424m5254lk.skadnetwork" },
					 { SKAdNetworkIdentifier = "av6w8kgt66.skadnetwork" },
					 { SKAdNetworkIdentifier = "s39g8k73mm.skadnetwork" },
					 { SKAdNetworkIdentifier = "lr83yxwka7.skadnetwork" },
					 { SKAdNetworkIdentifier = "22mmun2rn5.skadnetwork" },
					 { SKAdNetworkIdentifier = "su67r6k2v3.skadnetwork" },
					 { SKAdNetworkIdentifier = "4w7y6s5ca2.skadnetwork" },
					 { SKAdNetworkIdentifier = "dzg6xy7pwj.skadnetwork" },
					 { SKAdNetworkIdentifier = "y45688jllp.skadnetwork" },
					 { SKAdNetworkIdentifier = "hdw39hrw9y.skadnetwork" },
					 { SKAdNetworkIdentifier = "4dzt52r2t5.skadnetwork" },
					 { SKAdNetworkIdentifier = "5tjdwbrq8w.skadnetwork" },
					 { SKAdNetworkIdentifier = "32z4fx6l9h.skadnetwork" },
					 { SKAdNetworkIdentifier = "xy9t38ct57.skadnetwork" },
					 { SKAdNetworkIdentifier = "54nzkqm89y.skadnetwork" },
					 { SKAdNetworkIdentifier = "9b89h5y424.skadnetwork" },
					 { SKAdNetworkIdentifier = "79pbpufp6p.skadnetwork" },
					 { SKAdNetworkIdentifier = "s69wq72ugq.skadnetwork" },
					 { SKAdNetworkIdentifier = "k674qkevps.skadnetwork" },
					 { SKAdNetworkIdentifier = "578prtvx9j.skadnetwork" },
					 { SKAdNetworkIdentifier = "f73kdq92p3.skadnetwork" },
					 { SKAdNetworkIdentifier = "x44k69ngh6.skadnetwork" },
					 { SKAdNetworkIdentifier = "mp6xlyr22a.skadnetwork" },
					 { SKAdNetworkIdentifier = "qqp299437r.skadnetwork" },
					 { SKAdNetworkIdentifier = "3qcr597p9d.skadnetwork" },
					 { SKAdNetworkIdentifier = "97r2b46745.skadnetwork" },
					 { SKAdNetworkIdentifier = "6p4ks3rnbw.skadnetwork" },
					 { SKAdNetworkIdentifier = "rvh3l7un93.skadnetwork" },
					 { SKAdNetworkIdentifier = "zq492l623r.skadnetwork" },
					 { SKAdNetworkIdentifier = "x8uqf25wch.skadnetwork" },
					 { SKAdNetworkIdentifier = "b9bk5wbcq9.skadnetwork" },
					 { SKAdNetworkIdentifier = "bxvub5ada5.skadnetwork" },
					 { SKAdNetworkIdentifier = "krvm3zuq6h.skadnetwork" },
					 { SKAdNetworkIdentifier = "c3frkrj4fj.skadnetwork" },
					 { SKAdNetworkIdentifier = "v9wttpbfk9.skadnetwork" },
					 { SKAdNetworkIdentifier = "n38lu8286q.skadnetwork" },
					 { SKAdNetworkIdentifier = "3qy4746246.skadnetwork" },
					 { SKAdNetworkIdentifier = "v4nxqhlyqp.skadnetwork" },
					 { SKAdNetworkIdentifier = "8c4e2ghe7u.skadnetwork" },
					 { SKAdNetworkIdentifier = "r26jy69rpl.skadnetwork" },
					 { SKAdNetworkIdentifier = "8m87ys6875.skadnetwork" },
					 { SKAdNetworkIdentifier = "488r3q3dtq.skadnetwork" },
					 { SKAdNetworkIdentifier = "52fl2v3hgk.skadnetwork" },
					 { SKAdNetworkIdentifier = "m5mvw97r93.skadnetwork" },
					 { SKAdNetworkIdentifier = "89z7zv988g.skadnetwork" },
					 { SKAdNetworkIdentifier = "hb56zgv37p.skadnetwork" },
					 { SKAdNetworkIdentifier = "6v7lgmsu45.skadnetwork" },
					 { SKAdNetworkIdentifier = "m297p6643m.skadnetwork" },
					 { SKAdNetworkIdentifier = "3l6bd9hu43.skadnetwork" },
					 { SKAdNetworkIdentifier = "vcra2ehyfk.skadnetwork" },
					 { SKAdNetworkIdentifier = "a2p9lx4jpn.skadnetwork" },
					 { SKAdNetworkIdentifier = "238da6jt44.skadnetwork" },
					 { SKAdNetworkIdentifier = "v79kvwwj4g.skadnetwork" },
					 { SKAdNetworkIdentifier = "f7s53z58qe.skadnetwork" },
					 { SKAdNetworkIdentifier = "gta8lk7p23.skadnetwork" },
			 },
		},
	},
	android =
	{
		minSdkVersion = "16",
		applicationChildElements =
		{
			[[
				<meta-data android:name="com.google.android.gms.ads.APPLICATION_ID"
					android:value="[YOUR_ADMOB_APP_ID]"/>  -- replace with your app id. See: https://goo.gl/fQ2neu
			]],
		},
	},
	plugins =
	{
		-- Base
		['plugin.appodeal.base'] = { publisherId = 'com.coronalabs' },

		-- All types
		['plugin.appodeal.Bidmachine'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.GoogleAdMob'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.A4G'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.AppLovin'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.FacebookAudience'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.MyTarget'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.Smaato'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.StartApp'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.Unity'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.Yandex'] = { publisherId = 'com.coronalabs' },

		-- Banner
		['plugin.appodeal.AmazonAds'] = { publisherId = 'com.coronalabs' },

		-- Interstitial
		['plugin.appodeal.AdColony'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.AmazonAds'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.IronSource'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.Ogury'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.Vungle'] = { publisherId = 'com.coronalabs' },

		-- Rewarded Video
		['plugin.appodeal.AdColony'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.IronSource'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.Ogury'] = { publisherId = 'com.coronalabs' },
		['plugin.appodeal.Vungle'] = { publisherId = 'com.coronalabs' },
	},
}
``````

Make sure to include `Base` block for a plugin to work correctly. Then you can just comment out unnecessary ad types blocks, so that unneded adapters are not downloaded and linked to your project.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Disabling specific ad types and ad providers at this level with the help of new modular structure can greatly reduce the final build size.

</div>

For example, if you don't use Interstitials or Rewarded Video ad types in your app, you can comment blocks:

``````lua
-- Interstitial
--['plugin.appodeal.AdColony'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.AppLovin'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.Chartboost'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.FacebookAudience'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.Flurry'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.InMobi'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.IronSource'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.Mobvista'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.MyTarget'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.StartApp'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.Ogury'] = { publisherId = 'com.coronalabs' },

-- Rewarded Video
--['plugin.appodeal.AdColony'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.AppLovin'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.Chartboost'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.FacebookAudience'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.Flurry'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.InMobi'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.IronSource'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.Mobvista'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.MyTarget'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.StartApp'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.Unity'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.Vungle'] = { publisherId = 'com.coronalabs' },
--['plugin.appodeal.Tapjoy'] = { publisherId = 'com.coronalabs' },
``````

If for some reason you don't want to show ads from specific ad provider (for the sake of example, let it be `Flurry`), you can comment out it too, like this:

``````lua
-- Banner
['plugin.appodeal.AppLovin'] = { publisherId = 'com.coronalabs' },
['plugin.appodeal.FacebookAudience'] = { publisherId = 'com.coronalabs' },
['plugin.appodeal.Flurry'] = { publisherId = 'com.coronalabs' },
['plugin.appodeal.InMobi'] = { publisherId = 'com.coronalabs' },
['plugin.appodeal.MyTarget'] = { publisherId = 'com.coronalabs' },
['plugin.appodeal.Yandex'] = { publisherId = 'com.coronalabs' },
``````

If you are sure of your choice and want to keep your build settings nice and clean, you can remove commented ad types or/and adapters. Then for this particular example your build.settings file should look like this:

``````lua
-- Base
['plugin.appodeal.base'] = { publisherId = 'com.coronalabs' },
['plugin.appodeal.GoogleAdMob'] = { publisherId = 'com.coronalabs' },

-- Banner
['plugin.appodeal.AppLovin'] = { publisherId = 'com.coronalabs' },
['plugin.appodeal.FacebookAudience'] = { publisherId = 'com.coronalabs' },
['plugin.appodeal.InMobi'] = { publisherId = 'com.coronalabs' },
['plugin.appodeal.MyTarget'] = { publisherId = 'com.coronalabs' },
['plugin.appodeal.Yandex'] = { publisherId = 'com.coronalabs' },
['plugin.appodeal.AmazonAds'] = { publisherId = 'com.coronalabs' },
``````


<div class="guide-notebox">
<div class="notebox-title">Note</div>

From now on, you can use a beta version of modular plugin system. It includes the latest Appodeal SDK Beta, some new features and improvements. To use it, you should add a `beta` tag to module declaration like this, for example:

``````lua
settings =
{
	android =
	{
		applicationChildElements =
		{
			[[
				<meta-data android:name="com.google.android.gms.ads.APPLICATION_ID"
					android:value="[YOUR_ADMOB_APP_ID]"/>  -- replace with your app id. See: https://goo.gl/fQ2neu
			]],
		},
	},
	iphone =
	{
			plist =
			{
					SKAdNetworkItems = {
						{ SKAdNetworkIdentifier = "22mmun2rn5.skadnetwork" },
						{ SKAdNetworkIdentifier = "238da6jt44.skadnetwork" },
						{ SKAdNetworkIdentifier = "24t9a8vw3c.skadnetwork" },
						{ SKAdNetworkIdentifier = "24zw6aqk47.skadnetwork" },
						{ SKAdNetworkIdentifier = "252b5q8x7y.skadnetwork" },
						{ SKAdNetworkIdentifier = "275upjj5gd.skadnetwork" },
						{ SKAdNetworkIdentifier = "294l99pt4k.skadnetwork" },
						{ SKAdNetworkIdentifier = "2fnua5tdw4.skadnetwork" },
						{ SKAdNetworkIdentifier = "2u9pt9hc89.skadnetwork" },
						{ SKAdNetworkIdentifier = "32z4fx6l9h.skadnetwork" },
						{ SKAdNetworkIdentifier = "3l6bd9hu43.skadnetwork" },
						{ SKAdNetworkIdentifier = "3qcr597p9d.skadnetwork" },
						{ SKAdNetworkIdentifier = "3qy4746246.skadnetwork" },
						{ SKAdNetworkIdentifier = "3rd42ekr43.skadnetwork" },
						{ SKAdNetworkIdentifier = "3sh42y64q3.skadnetwork" },
						{ SKAdNetworkIdentifier = "424m5254lk.skadnetwork" },
						{ SKAdNetworkIdentifier = "4468km3ulz.skadnetwork" },
						{ SKAdNetworkIdentifier = "44jx6755aq.skadnetwork" },
						{ SKAdNetworkIdentifier = "44n7hlldy6.skadnetwork" },
						{ SKAdNetworkIdentifier = "47vhws6wlr.skadnetwork" },
						{ SKAdNetworkIdentifier = "488r3q3dtq.skadnetwork" },
						{ SKAdNetworkIdentifier = "4dzt52r2t5.skadnetwork" },
						{ SKAdNetworkIdentifier = "4fzdc2evr5.skadnetwork" },
						{ SKAdNetworkIdentifier = "4mn522wn87.skadnetwork" },
						{ SKAdNetworkIdentifier = "4pfyvq9l8r.skadnetwork" },
						{ SKAdNetworkIdentifier = "4w7y6s5ca2.skadnetwork" },
						{ SKAdNetworkIdentifier = "523jb4fst2.skadnetwork" },
						{ SKAdNetworkIdentifier = "52fl2v3hgk.skadnetwork" },
						{ SKAdNetworkIdentifier = "54nzkqm89y.skadnetwork" },
						{ SKAdNetworkIdentifier = "578prtvx9j.skadnetwork" },
						{ SKAdNetworkIdentifier = "5a6flpkh64.skadnetwork" },
						{ SKAdNetworkIdentifier = "5l3tpt7t6e.skadnetwork" },
						{ SKAdNetworkIdentifier = "5lm9lj6jb7.skadnetwork" },
						{ SKAdNetworkIdentifier = "5tjdwbrq8w.skadnetwork" },
						{ SKAdNetworkIdentifier = "6964rsfnh4.skadnetwork" },
						{ SKAdNetworkIdentifier = "6g9af3uyq4.skadnetwork" },
						{ SKAdNetworkIdentifier = "6p4ks3rnbw.skadnetwork" },
						{ SKAdNetworkIdentifier = "6v7lgmsu45.skadnetwork" },
						{ SKAdNetworkIdentifier = "6xzpu9s2p8.skadnetwork" },
						{ SKAdNetworkIdentifier = "737z793b9f.skadnetwork" },
						{ SKAdNetworkIdentifier = "74b6s63p6l.skadnetwork" },
						{ SKAdNetworkIdentifier = "79pbpufp6p.skadnetwork" },
						{ SKAdNetworkIdentifier = "7fmhfwg9en.skadnetwork" },
						{ SKAdNetworkIdentifier = "7rz58n8ntl.skadnetwork" },
						{ SKAdNetworkIdentifier = "7ug5zh24hu.skadnetwork" },
						{ SKAdNetworkIdentifier = "84993kbrcf.skadnetwork" },
						{ SKAdNetworkIdentifier = "89z7zv988g.skadnetwork" },
						{ SKAdNetworkIdentifier = "8c4e2ghe7u.skadnetwork" },
						{ SKAdNetworkIdentifier = "8m87ys6875.skadnetwork" },
						{ SKAdNetworkIdentifier = "8r8llnkz5a.skadnetwork" },
						{ SKAdNetworkIdentifier = "8s468mfl3y.skadnetwork" },
						{ SKAdNetworkIdentifier = "97r2b46745.skadnetwork" },
						{ SKAdNetworkIdentifier = "9b89h5y424.skadnetwork" },
						{ SKAdNetworkIdentifier = "9nlqeag3gk.skadnetwork" },
						{ SKAdNetworkIdentifier = "9rd848q2bz.skadnetwork" },
						{ SKAdNetworkIdentifier = "9t245vhmpl.skadnetwork" },
						{ SKAdNetworkIdentifier = "9vvzujtq5s.skadnetwork" },
						{ SKAdNetworkIdentifier = "9yg77x724h.skadnetwork" },
						{ SKAdNetworkIdentifier = "a2p9lx4jpn.skadnetwork" },
						{ SKAdNetworkIdentifier = "a7xqa6mtl2.skadnetwork" },
						{ SKAdNetworkIdentifier = "a8cz6cu7e5.skadnetwork" },
						{ SKAdNetworkIdentifier = "av6w8kgt66.skadnetwork" },
						{ SKAdNetworkIdentifier = "b9bk5wbcq9.skadnetwork" },
						{ SKAdNetworkIdentifier = "bxvub5ada5.skadnetwork" },
						{ SKAdNetworkIdentifier = "c3frkrj4fj.skadnetwork" },
						{ SKAdNetworkIdentifier = "c6k4g5qg8m.skadnetwork" },
						{ SKAdNetworkIdentifier = "cg4yq2srnc.skadnetwork" },
						{ SKAdNetworkIdentifier = "cj5566h2ga.skadnetwork" },
						{ SKAdNetworkIdentifier = "cp8zw746q7.skadnetwork" },
						{ SKAdNetworkIdentifier = "cs644xg564.skadnetwork" },
						{ SKAdNetworkIdentifier = "cstr6suwn9.skadnetwork" },
						{ SKAdNetworkIdentifier = "dbu4b84rxf.skadnetwork" },
						{ SKAdNetworkIdentifier = "dkc879ngq3.skadnetwork" },
						{ SKAdNetworkIdentifier = "dzg6xy7pwj.skadnetwork" },
						{ SKAdNetworkIdentifier = "e5fvkxwrpn.skadnetwork" },
						{ SKAdNetworkIdentifier = "ecpz2srf59.skadnetwork" },
						{ SKAdNetworkIdentifier = "eh6m2bh4zr.skadnetwork" },
						{ SKAdNetworkIdentifier = "ejvt5qm6ak.skadnetwork" },
						{ SKAdNetworkIdentifier = "f38h382jlk.skadnetwork" },
						{ SKAdNetworkIdentifier = "f73kdq92p3.skadnetwork" },
						{ SKAdNetworkIdentifier = "f7s53z58qe.skadnetwork" },
						{ SKAdNetworkIdentifier = "feyaarzu9v.skadnetwork" },
						{ SKAdNetworkIdentifier = "g28c52eehv.skadnetwork" },
						{ SKAdNetworkIdentifier = "g2y4y55b64.skadnetwork" },
						{ SKAdNetworkIdentifier = "ggvn48r87g.skadnetwork" },
						{ SKAdNetworkIdentifier = "glqzh8vgby.skadnetwork" },
						{ SKAdNetworkIdentifier = "gta8lk7p23.skadnetwork" },
						{ SKAdNetworkIdentifier = "gta9lk7p23.skadnetwork" },
						{ SKAdNetworkIdentifier = "hb56zgv37p.skadnetwork" },
						{ SKAdNetworkIdentifier = "hdw39hrw9y.skadnetwork" },
						{ SKAdNetworkIdentifier = "hs6bdukanm.skadnetwork" },
						{ SKAdNetworkIdentifier = "k674qkevps.skadnetwork" },
						{ SKAdNetworkIdentifier = "kbd757ywx3.skadnetwork" },
						{ SKAdNetworkIdentifier = "kbmxgpxpgc.skadnetwork" },
						{ SKAdNetworkIdentifier = "klf5c3l5u5.skadnetwork" },
						{ SKAdNetworkIdentifier = "krvm3zuq6h.skadnetwork" },
						{ SKAdNetworkIdentifier = "lr83yxwka7.skadnetwork" },
						{ SKAdNetworkIdentifier = "ludvb6z3bs.skadnetwork" },
						{ SKAdNetworkIdentifier = "m297p6643m.skadnetwork" },
						{ SKAdNetworkIdentifier = "m5mvw97r93.skadnetwork" },
						{ SKAdNetworkIdentifier = "m8dbw4sv7c.skadnetwork" },
						{ SKAdNetworkIdentifier = "mlmmfzh3r3.skadnetwork" },
						{ SKAdNetworkIdentifier = "mls7yz5dvl.skadnetwork" },
						{ SKAdNetworkIdentifier = "mp6xlyr22a.skadnetwork" },
						{ SKAdNetworkIdentifier = "mtkv5xtk9e.skadnetwork" },
						{ SKAdNetworkIdentifier = "n38lu8286q.skadnetwork" },
						{ SKAdNetworkIdentifier = "n66cz3y3bx.skadnetwork" },
						{ SKAdNetworkIdentifier = "n6fk4nfna4.skadnetwork" },
						{ SKAdNetworkIdentifier = "n9x2a789qt.skadnetwork" },
						{ SKAdNetworkIdentifier = "nzq8sh4pbs.skadnetwork" },
						{ SKAdNetworkIdentifier = "p78axxw29g.skadnetwork" },
						{ SKAdNetworkIdentifier = "ppxm28t8ap.skadnetwork" },
						{ SKAdNetworkIdentifier = "prcb7njmu6.skadnetwork" },
						{ SKAdNetworkIdentifier = "pwa73g5rt2.skadnetwork" },
						{ SKAdNetworkIdentifier = "pwdxu55a5a.skadnetwork" },
						{ SKAdNetworkIdentifier = "qqp299437r.skadnetwork" },
						{ SKAdNetworkIdentifier = "r45fhb6rf7.skadnetwork" },
						{ SKAdNetworkIdentifier = "rvh3l7un93.skadnetwork" },
						{ SKAdNetworkIdentifier = "rx5hdcabgc.skadnetwork" },
						{ SKAdNetworkIdentifier = "s39g8k73mm.skadnetwork" },
						{ SKAdNetworkIdentifier = "s69wq72ugq.skadnetwork" },
						{ SKAdNetworkIdentifier = "su67r6k2v3.skadnetwork" },
						{ SKAdNetworkIdentifier = "t38b2kh725.skadnetwork" },
						{ SKAdNetworkIdentifier = "tl55sbb4fm.skadnetwork" },
						{ SKAdNetworkIdentifier = "u679fj5vs4.skadnetwork" },
						{ SKAdNetworkIdentifier = "uw77j35x4d.skadnetwork" },
						{ SKAdNetworkIdentifier = "v4nxqhlyqp.skadnetwork" },
						{ SKAdNetworkIdentifier = "v72qych5uu.skadnetwork" },
						{ SKAdNetworkIdentifier = "v79kvwwj4g.skadnetwork" },
						{ SKAdNetworkIdentifier = "v9wttpbfk9.skadnetwork" },
						{ SKAdNetworkIdentifier = "vcra2ehyfk.skadnetwork" },
						{ SKAdNetworkIdentifier = "vutu7akeur.skadnetwork" },
						{ SKAdNetworkIdentifier = "w9q455wk68.skadnetwork" },
						{ SKAdNetworkIdentifier = "wg4vff78zm.skadnetwork" },
						{ SKAdNetworkIdentifier = "wzmmz9fp6w.skadnetwork" },
						{ SKAdNetworkIdentifier = "x44k69ngh6.skadnetwork" },
						{ SKAdNetworkIdentifier = "x5l83yy675.skadnetwork" },
						{ SKAdNetworkIdentifier = "x8jxxk4ff5.skadnetwork" },
						{ SKAdNetworkIdentifier = "x8uqf25wch.skadnetwork" },
						{ SKAdNetworkIdentifier = "xy9t38ct57.skadnetwork" },
						{ SKAdNetworkIdentifier = "y45688jllp.skadnetwork" },
						{ SKAdNetworkIdentifier = "y5ghdn5j9k.skadnetwork" },
						{ SKAdNetworkIdentifier = "yclnxrl5pm.skadnetwork" },
						{ SKAdNetworkIdentifier = "ydx93a7ass.skadnetwork" },
						{ SKAdNetworkIdentifier = "zmvfpc5aq8.skadnetwork" },
						{ SKAdNetworkIdentifier = "zq492l623r.skadnetwork" },
						{ SKAdNetworkIdentifier = "z959bm4gru.skadnetwork" },
						{ SKAdNetworkIdentifier = "bmxgpxpgc.skadnetwork" },
						{ SKAdNetworkIdentifier = "9g2aggbj52.skadnetwork" },
						{ SKAdNetworkIdentifier = "mqn7fxpca7.skadnetwork" },
						{ SKAdNetworkIdentifier = "g6gcrrvk4p.skadnetwork" },
						{ SKAdNetworkIdentifier = "6yxyv74ff7.skadnetwork" },
						{ SKAdNetworkIdentifier = "633vhxswh4.skadnetwork" },
						{ SKAdNetworkIdentifier = "tmhh9296z4.skadnetwork" },
						{ SKAdNetworkIdentifier = "zh3b7bxvad.skadnetwork" },
						{ SKAdNetworkIdentifier = "xmn954pzmp.skadnetwork" },
						{ SKAdNetworkIdentifier = "79w64w269u.skadnetwork" },
						{ SKAdNetworkIdentifier = "d7g9azk84q.skadnetwork" },
						{ SKAdNetworkIdentifier = "866k9ut3g3.skadnetwork" },
						{ SKAdNetworkIdentifier = "2q884k2j68.skadnetwork" },
						{ SKAdNetworkIdentifier = "gfat3222tu.skadnetwork" },
						{ SKAdNetworkIdentifier = "pd25vrrwzn.skadnetwork" },
						{ SKAdNetworkIdentifier = "y755zyxw56.skadnetwork" },
						{ SKAdNetworkIdentifier = "qlbq5gtkt8.skadnetwork" },
						{ SKAdNetworkIdentifier = "67369282zy.skadnetwork" },
						{ SKAdNetworkIdentifier = "899vrgt9g8.skadnetwork" },
						{ SKAdNetworkIdentifier = "mj797d8u6f.skadnetwork" },
						{ SKAdNetworkIdentifier = "88k8774x49.skadnetwork" },
						{ SKAdNetworkIdentifier = "t3b3f7n3x8.skadnetwork" },
						{ SKAdNetworkIdentifier = "c7g47wypnu.skadnetwork" },
						{ SKAdNetworkIdentifier = "z5b3gh5ugf.skadnetwork" },
						{ SKAdNetworkIdentifier = "dd3a75yxkv.skadnetwork" },
						{ SKAdNetworkIdentifier = "h5jmj969g5.skadnetwork" },
						{ SKAdNetworkIdentifier = "dr774724x4.skadnetwork" },
						{ SKAdNetworkIdentifier = "t7ky8fmwkd.skadnetwork" },
						{ SKAdNetworkIdentifier = "fz2k2k5tej.skadnetwork" },
						{ SKAdNetworkIdentifier = "w28pnjg2k4.skadnetwork" },
						{ SKAdNetworkIdentifier = "2rq3zucswp.skadnetwork" },
						{ SKAdNetworkIdentifier = "vc83br9sjg.skadnetwork" },
						{ SKAdNetworkIdentifier = "eqhxz8m8av.skadnetwork" },
						{ SKAdNetworkIdentifier = "7k3cvf297u.skadnetwork" },
						{ SKAdNetworkIdentifier = "nu4557a4je.skadnetwork" },
						{ SKAdNetworkIdentifier = "7tnzynbdc7.skadnetwork" },
						{ SKAdNetworkIdentifier = "l6nv3x923s.skadnetwork" },
						{ SKAdNetworkIdentifier = "h8vml93bkz.skadnetwork" },
						{ SKAdNetworkIdentifier = "uzqba5354d.skadnetwork" },
						{ SKAdNetworkIdentifier = "8qiegk9qfv.skadnetwork" },
						{ SKAdNetworkIdentifier = "xx9sdjej2w.skadnetwork" },
						{ SKAdNetworkIdentifier = "au67k4efj4.skadnetwork" },
						{ SKAdNetworkIdentifier = "dmv22haz9p.skadnetwork" },
						{ SKAdNetworkIdentifier = "7fbxrn65az.skadnetwork" },
						{ SKAdNetworkIdentifier = "b55w3d8y8z.skadnetwork" },
						{ SKAdNetworkIdentifier = "v7896pgt74.skadnetwork" },
						{ SKAdNetworkIdentifier = "5ghnmfs3dh.skadnetwork" },
						{ SKAdNetworkIdentifier = "627r9wr2y5.skadnetwork" },
						{ SKAdNetworkIdentifier = "sczv5946wb.skadnetwork" },
						{ SKAdNetworkIdentifier = "8w3np9l82g.skadnetwork" },
						{ SKAdNetworkIdentifier = "nrt9jy4kw9.skadnetwork" },
						{ SKAdNetworkIdentifier = "7953jerfzd.skadnetwork" },
						{ SKAdNetworkIdentifier = "dn942472g5.skadnetwork" },
						{ SKAdNetworkIdentifier = "cad8qz2s3j.skadnetwork" },
						{ SKAdNetworkIdentifier = "r26jy69rpl.skadnetwork" },
						{ SKAdNetworkIdentifier = "jb7bn6koa5.skadnetwork" },
						{ SKAdNetworkIdentifier = "fkak3gfpt6.skadnetwork" },
						{ SKAdNetworkIdentifier = "2tdux39lx8.skadnetwork" },
						{ SKAdNetworkIdentifier = "3cgn6rq224.skadnetwork" },
						{ SKAdNetworkIdentifier = "nfqy3847ph.skadnetwork" },
						{ SKAdNetworkIdentifier = "dticjx1a9i.skadnetwork" },
						{ SKAdNetworkIdentifier = "9wsyqb3ku7.skadnetwork" },
						{ SKAdNetworkIdentifier = "qu637u8glc.skadnetwork" },
						{ SKAdNetworkIdentifier = "x5854y7y24.skadnetwork" },
						{ SKAdNetworkIdentifier = "gvmwg8q7h5.skadnetwork" },
						{ SKAdNetworkIdentifier = "bvpn9ufa9b.skadnetwork" },
						{ SKAdNetworkIdentifier = "6qx585k4p6.skadnetwork" },
						{ SKAdNetworkIdentifier = "l93v5h6a4m.skadnetwork" },
						{ SKAdNetworkIdentifier = "axh5283zss.skadnetwork" },
						{ SKAdNetworkIdentifier = "5mv394q32t.skadnetwork" },
						{ SKAdNetworkIdentifier = "hjevpa356n.skadnetwork" },
						{ SKAdNetworkIdentifier = "ln5gz23vtd.skadnetwork" },
						{ SKAdNetworkIdentifier = "pu4na253f3.skadnetwork" },
						{ SKAdNetworkIdentifier = "t6d3zquu66.skadnetwork" },
						{ SKAdNetworkIdentifier = "x2jnk7ly8j.skadnetwork" },
						{ SKAdNetworkIdentifier = "yrqqpx2mcb.skadnetwork" },
						{ SKAdNetworkIdentifier = "z4gj7hsk7h.skadnetwork" },
						{ SKAdNetworkIdentifier = "bd757ywx3.skadnetwork" },
						{ SKAdNetworkIdentifier = "33r6p7g8nc.skadnetwork" },
						{ SKAdNetworkIdentifier = "g69uk9uh2b.skadnetwork" }
					},
			},
	},
	plugins =
	{
		["plugin.appodeal.beta.base"] = { publisherId = "com.coronalabs" },
		["plugin.appodeal.beta.AdColony"] = { publisherId = "com.coronalabs" },
		["plugin.appodeal.beta.AppLovin"] = { publisherId = "com.coronalabs" },
		["plugin.appodeal.beta.FacebookAudience"] = { publisherId = "com.coronalabs" },
		["plugin.appodeal.beta.GoogleAdMob"] = { publisherId = "com.coronalabs" },
		["plugin.appodeal.beta.InMobi"] = { publisherId = "com.coronalabs" },
		["plugin.appodeal.beta.Mobvista"] = { publisherId = "com.coronalabs" },
		["plugin.appodeal.beta.MyTarget"] = { publisherId = "com.coronalabs" },
		["plugin.appodeal.beta.Unity"] = { publisherId = "com.coronalabs" },
		["plugin.appodeal.beta.Vungle"] = { publisherId = "com.coronalabs" },
	},
}
``````

Please keep in mind, that using beta versions of both Appodeal SDK and CORONA_CORE_PRODUCT Appodeal plugin may cause unexpected issues. We've made a profound tests of a new system, but you should use it at your own risk.

</div>


<!--- Include ATS "override" template block --->
TEMPLATE_ATS
<!--- --->

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`
* `"android.permission.ACCESS_NETWORK_STATE"`
* `"android.permission.WRITE_EXTERNAL_STORAGE"`

In addition, if you wish to receive targeted ads in your app and increase your chances for higher revenue, you can include any or all of the following permissions:

* `"android.permission.GET_ACCOUNTS"`
* `"android.permission.ACCESS_COARSE_LOCATION"`
* `"android.permission.ACCESS_FINE_LOCATION"`

</div>

## Sample project

* [View on GitHub](https://github.com/coronalabs/plugins-sample-appodeal)
