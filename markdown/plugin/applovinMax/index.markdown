# applovinMax.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Library][api.type.Library]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			ads, advertising, AppLovin, AppLovin Max
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview


The AppLovin Max plugin allows developers to monetize users and use mediation through [AppLovin Max](https://www.applovin.com/max/) static interstitial, video interstitial, and rewarded video ads.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* For the legacy non-Max plugin click [here][plugin.applovin]

* The main api differences between legacy are: Sdk Keys are moved into [project settings](#settings), platform specific unitIds are required in [applovinMax.load()][plugin.applovinMax.load], and a few have [phases][plugin.applovinMax.event.adsRequest.phase] changed.

* Once you are [registered](https://www.applovin.com/signup), obtain your __SDK&nbsp;key__ from the [AppLovin developer portal](https://dash.applovin.com). From the __Account__ section, expand the __Account__ menu on the left side, select __Keys__, and your SDK key should be revealed.

* Native ads are not supported at this time.

* Apps are automatically added to the [AppLovin developer portal](https://dash.applovin.com) when you [include](#settings) this plugin and app keys within your project, `require()`&nbsp;it, and call [applovin.init()][plugin.applovin.init].

* If you use the plugin and make changes to the ad settings in the [AppLovin developer portal](https://www.applovin.com/manage)

* Applovin Max contains various SDKs for the ad providers it mediates. This means that you can __not__ use Applovin Max in conjunction with [AdColony][plugin.adcolony], [AdMob][plugin.admob], [Chartboost][plugin.chartboost], [Facebook Audience Network][plugin.fbAudienceNetwork], [InMobi][plugin.inmobi], [Unity Ads][plugin.unityads], or [Vungle][plugin.vungle].

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Check out new `setHasUserConsent` method to enable GDPR data collection restrictions.

</div>

## Registration

To begin, please register with [AppLovin Max](https://www.applovin.com/signup). Once you have access to the [AppLovin developer portal](https://dash.applovin.com), you can view your apps, select ad preferences, and more.


## Syntax

<div id="example">

##### AppLovin

	local applovinMax = require( "plugin.applovinMax" )

</div>


## Functions

#### [applovinMax.init()][plugin.applovinMax.init]

#### [applovinMax.load()][plugin.applovinMax.load]

#### [applovinMax.isLoaded()][plugin.applovinMax.isLoaded]

#### [applovinMax.show()][plugin.applovinMax.show]

#### [applovinMax.setUserDetails()][plugin.applovinMax.setUserDetails]

#### [applovinMax.hide()][plugin.applovinMax.hide]

#### [applovinMax.setHasUserConsent()][plugin.applovinMax.setHasUserConsent]

#### [applovinMax.setIsAgeRestrictedUser()][plugin.applovinMax.setIsAgeRestrictedUser]

#### [applovinMax.showDebugger()][plugin.applovinMax.showDebugger]


## Events

#### [adsRequest][plugin.applovinMax.event.adsRequest]


<a id="settings"></a>

## Project Settings


To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase. Also add your Sdk keys for Android and/or iOS as seen below.

<div id="example">

##### AppLovin Max

``````{ brush="lua" gutter="false" first-line="1" highlight="[9,18]" }
settings =
{
	android =
	{
		applicationChildElements =
		{
				-- Array of strings
				[[
					<meta-data android:name="applovin.sdk.key" android:value="XXXXXXXXXXXXX"/>
				]],
				---- replace XXXXXXXXXXXXX with your Android Applovin SDK key
		},
	},
	iphone =
	{
		plist =
		{
			AppLovinSdkKey = "XXXXXXXXXXXXX", -- replace XXXXXXXXXXXXX with your iOS Applovin SDK key
			NSAppTransportSecurity = { NSAllowsArbitraryLoads=true },
			NSUserTrackingUsageDescription = "This only uses device info for less annoying, more relevant ads.",
			SKAdNetworkItems = {
				{SKAdNetworkIdentifier= "275upjj5gd.skadnetwork"},
				{SKAdNetworkIdentifier= "294l99pt4k.skadnetwork"},
				{SKAdNetworkIdentifier= "2fnua5tdw4.skadnetwork"},
				{SKAdNetworkIdentifier= "2u9pt9hc89.skadnetwork"},
				{SKAdNetworkIdentifier= "3rd42ekr43.skadnetwork"},
				{SKAdNetworkIdentifier= "4468km3ulz.skadnetwork"},
				{SKAdNetworkIdentifier= "44jx6755aq.skadnetwork"},
				{SKAdNetworkIdentifier= "44n7hlldy6.skadnetwork"},
				{SKAdNetworkIdentifier= "4fzdc2evr5.skadnetwork"},
				{SKAdNetworkIdentifier= "4pfyvq9l8r.skadnetwork"},
				{SKAdNetworkIdentifier= "523jb4fst2.skadnetwork"},
				{SKAdNetworkIdentifier= "5l3tpt7t6e.skadnetwork"},
				{SKAdNetworkIdentifier= "5lm9lj6jb7.skadnetwork"},
				{SKAdNetworkIdentifier= "6964rsfnh4.skadnetwork"},
				{SKAdNetworkIdentifier= "6g9af3uyq4.skadnetwork"},
				{SKAdNetworkIdentifier= "74b6s63p6l.skadnetwork"},
				{SKAdNetworkIdentifier= "7rz58n8ntl.skadnetwork"},
				{SKAdNetworkIdentifier= "7ug5zh24hu.skadnetwork"},
				{SKAdNetworkIdentifier= "84993kbrcf.skadnetwork"},
				{SKAdNetworkIdentifier= "8s468mfl3y.skadnetwork"},
				{SKAdNetworkIdentifier= "9nlqeag3gk.skadnetwork"},
				{SKAdNetworkIdentifier= "9rd848q2bz.skadnetwork"},
				{SKAdNetworkIdentifier= "9t245vhmpl.skadnetwork"},
				{SKAdNetworkIdentifier= "a7xqa6mtl2.skadnetwork"},
				{SKAdNetworkIdentifier= "c6k4g5qg8m.skadnetwork"},
				{SKAdNetworkIdentifier= "cg4yq2srnc.skadnetwork"},
				{SKAdNetworkIdentifier= "cj5566h2ga.skadnetwork"},
				{SKAdNetworkIdentifier= "e5fvkxwrpn.skadnetwork"},
				{SKAdNetworkIdentifier= "ejvt5qm6ak.skadnetwork"},
				{SKAdNetworkIdentifier= "g28c52eehv.skadnetwork"},
				{SKAdNetworkIdentifier= "g2y4y55b64.skadnetwork"},
				{SKAdNetworkIdentifier= "gta9lk7p23.skadnetwork"},
				{SKAdNetworkIdentifier= "hs6bdukanm.skadnetwork"},
				{SKAdNetworkIdentifier= "kbd757ywx3.skadnetwork"},
				{SKAdNetworkIdentifier= "kbmxgpxpgc.skadnetwork"},
				{SKAdNetworkIdentifier= "klf5c3l5u5.skadnetwork"},
				{SKAdNetworkIdentifier= "m8dbw4sv7c.skadnetwork"},
				{SKAdNetworkIdentifier= "mlmmfzh3r3.skadnetwork"},
				{SKAdNetworkIdentifier= "mtkv5xtk9e.skadnetwork"},
				{SKAdNetworkIdentifier= "n6fk4nfna4.skadnetwork"},
				{SKAdNetworkIdentifier= "n9x2a789qt.skadnetwork"},
				{SKAdNetworkIdentifier= "ppxm28t8ap.skadnetwork"},
				{SKAdNetworkIdentifier= "prcb7njmu6.skadnetwork"},
				{SKAdNetworkIdentifier= "pwa73g5rt2.skadnetwork"},
				{SKAdNetworkIdentifier= "pwdxu55a5a.skadnetwork"},
				{SKAdNetworkIdentifier= "qqp299437r.skadnetwork"},
				{SKAdNetworkIdentifier= "r45fhb6rf7.skadnetwork"},
				{SKAdNetworkIdentifier= "rx5hdcabgc.skadnetwork"},
				{SKAdNetworkIdentifier= "t38b2kh725.skadnetwork"},
				{SKAdNetworkIdentifier= "tl55sbb4fm.skadnetwork"},
				{SKAdNetworkIdentifier= "u679fj5vs4.skadnetwork"},
				{SKAdNetworkIdentifier= "uw77j35x4d.skadnetwork"},
				{SKAdNetworkIdentifier= "v72qych5uu.skadnetwork"},
				{SKAdNetworkIdentifier= "wg4vff78zm.skadnetwork"},
				{SKAdNetworkIdentifier= "wzmmz9fp6w.skadnetwork"},
				{SKAdNetworkIdentifier= "yclnxrl5pm.skadnetwork"},
				{SKAdNetworkIdentifier= "ydx93a7ass.skadnetwork"},
				{SKAdNetworkIdentifier= "3qcr597p9d.skadnetwork"},
				{SKAdNetworkIdentifier= "3qy4746246.skadnetwork"},
				{SKAdNetworkIdentifier= "3sh42y64q3.skadnetwork"},
				{SKAdNetworkIdentifier= "424m5254lk.skadnetwork"},
				{SKAdNetworkIdentifier= "4dzt52r2t5.skadnetwork"},
				{SKAdNetworkIdentifier= "578prtvx9j.skadnetwork"},
				{SKAdNetworkIdentifier= "5a6flpkh64.skadnetwork"},
				{SKAdNetworkIdentifier= "8c4e2ghe7u.skadnetwork"},
				{SKAdNetworkIdentifier= "av6w8kgt66.skadnetwork"},
				{SKAdNetworkIdentifier= "cstr6suwn9.skadnetwork"},
				{SKAdNetworkIdentifier= "f38h382jlk.skadnetwork"},
				{SKAdNetworkIdentifier= "p78axxw29g.skadnetwork"},
				{SKAdNetworkIdentifier= "s39g8k73mm.skadnetwork"},
				{SKAdNetworkIdentifier= "v4nxqhlyqp.skadnetwork"},
				{SKAdNetworkIdentifier= "zq492l623r.skadnetwork"},
				{SKAdNetworkIdentifier= "24t9a8vw3c.skadnetwork"},
				{SKAdNetworkIdentifier= "32z4fx6l9h.skadnetwork"},
				{SKAdNetworkIdentifier= "54nzkqm89y.skadnetwork"},
				{SKAdNetworkIdentifier= "6xzpu9s2p8.skadnetwork"},
				{SKAdNetworkIdentifier= "79pbpufp6p.skadnetwork"},
				{SKAdNetworkIdentifier= "9b89h5y424.skadnetwork"},
				{SKAdNetworkIdentifier= "c3frkrj4fj.skadnetwork"},
				{SKAdNetworkIdentifier= "feyaarzu9v.skadnetwork"},
				{SKAdNetworkIdentifier= "ggvn48r87g.skadnetwork"},
				{SKAdNetworkIdentifier= "glqzh8vgby.skadnetwork"},
				{SKAdNetworkIdentifier= "k674qkevps.skadnetwork"},
				{SKAdNetworkIdentifier= "ludvb6z3bs.skadnetwork"},
				{SKAdNetworkIdentifier= "rvh3l7un93.skadnetwork"},
				{SKAdNetworkIdentifier= "x8jxxk4ff5.skadnetwork"},
				{SKAdNetworkIdentifier= "xy9t38ct57.skadnetwork"},
				{SKAdNetworkIdentifier= "zmvfpc5aq8.skadnetwork"},
				{SKAdNetworkIdentifier= "22mmun2rn5.skadnetwork"},
				{SKAdNetworkIdentifier= "4w7y6s5ca2.skadnetwork"},
				{SKAdNetworkIdentifier= "5tjdwbrq8w.skadnetwork"},
				{SKAdNetworkIdentifier= "6p4ks3rnbw.skadnetwork"},
				{SKAdNetworkIdentifier= "737z793b9f.skadnetwork"},
				{SKAdNetworkIdentifier= "97r2b46745.skadnetwork"},
				{SKAdNetworkIdentifier= "b9bk5wbcq9.skadnetwork"},
				{SKAdNetworkIdentifier= "bxvub5ada5.skadnetwork"},
				{SKAdNetworkIdentifier= "dzg6xy7pwj.skadnetwork"},
				{SKAdNetworkIdentifier= "f73kdq92p3.skadnetwork"},
				{SKAdNetworkIdentifier= "hdw39hrw9y.skadnetwork"},
				{SKAdNetworkIdentifier= "lr83yxwka7.skadnetwork"},
				{SKAdNetworkIdentifier= "mls7yz5dvl.skadnetwork"},
				{SKAdNetworkIdentifier= "mp6xlyr22a.skadnetwork"},
				{SKAdNetworkIdentifier= "s69wq72ugq.skadnetwork"},
				{SKAdNetworkIdentifier= "su67r6k2v3.skadnetwork"},
				{SKAdNetworkIdentifier= "w9q455wk68.skadnetwork"},
				{SKAdNetworkIdentifier= "x44k69ngh6.skadnetwork"},
				{SKAdNetworkIdentifier= "x8uqf25wch.skadnetwork"},
				{SKAdNetworkIdentifier= "y45688jllp.skadnetwork"},
				{SKAdNetworkIdentifier= "n38lu8286q.skadnetwork"},
				{SKAdNetworkIdentifier= "v9wttpbfk9.skadnetwork"},
				{SKAdNetworkIdentifier= "252b5q8x7y.skadnetwork"},
				{SKAdNetworkIdentifier= "9g2aggbj52.skadnetwork"},
				{SKAdNetworkIdentifier= "krvm3zuq6h.skadnetwork"},
				{SKAdNetworkIdentifier= "nu4557a4je.skadnetwork"},
				{SKAdNetworkIdentifier= "r26jy69rpl.skadnetwork"},
				{SKAdNetworkIdentifier= "3l6bd9hu43.skadnetwork"},
				{SKAdNetworkIdentifier= "488r3q3dtq.skadnetwork"},
				{SKAdNetworkIdentifier= "52fl2v3hgk.skadnetwork"},
				{SKAdNetworkIdentifier= "6v7lgmsu45.skadnetwork"},
				{SKAdNetworkIdentifier= "89z7zv988g.skadnetwork"},
				{SKAdNetworkIdentifier= "8m87ys6875.skadnetwork"},
				{SKAdNetworkIdentifier= "hb56zgv37p.skadnetwork"},
				{SKAdNetworkIdentifier= "m297p6643m.skadnetwork"},
				{SKAdNetworkIdentifier= "m5mvw97r93.skadnetwork"},
				{SKAdNetworkIdentifier= "vcra2ehyfk.skadnetwork"},
				{SKAdNetworkIdentifier= "238da6jt44.skadnetwork"},
				{SKAdNetworkIdentifier= "9yg77x724h.skadnetwork"},
				{SKAdNetworkIdentifier= "ecpz2srf59.skadnetwork"},
				{SKAdNetworkIdentifier= "gvmwg8q7h5.skadnetwork"},
				{SKAdNetworkIdentifier= "n66cz3y3bx.skadnetwork"},
				{SKAdNetworkIdentifier= "nzq8sh4pbs.skadnetwork"},
				{SKAdNetworkIdentifier= "pu4na253f3.skadnetwork"},
				{SKAdNetworkIdentifier= "v79kvwwj4g.skadnetwork"},
				{SKAdNetworkIdentifier= "yrqqpx2mcb.skadnetwork"},
				{SKAdNetworkIdentifier= "z4gj7hsk7h.skadnetwork"},
				{SKAdNetworkIdentifier= "f7s53z58qe.skadnetwork"},
				{SKAdNetworkIdentifier= "7953jerfzd.skadnetwork"}

			}
		},
	},
	plugins =
	{
		-- Base
		["plugin.applovinMax"] =
		{
			publisherId = "com.solar2d"
		},

		--Adapters
		["plugin.applovinMax.AdColony"] = {publisherId = "com.solar2d"},
	 	["plugin.applovinMax.Chartboost"] = {publisherId = "com.solar2d"},
		["plugin.applovinMax.Facebook"] = {publisherId = "com.solar2d"},
		["plugin.applovinMax.Fyber"] = {publisherId = "com.solar2d"},
		["plugin.applovinMax.GoogleAdMob"] = {publisherId = "com.solar2d"},
		["plugin.applovinMax.HyprMX"] = {publisherId = "com.solar2d"},
		["plugin.applovinMax.InMobi"] = {publisherId = "com.solar2d"},
		["plugin.applovinMax.IronSource"] = {publisherId = "com.solar2d"},
		["plugin.applovinMax.Maio"] = {publisherId = "com.solar2d"},
		["plugin.applovinMax.Mintegral"] = {publisherId = "com.solar2d"},
		["plugin.applovinMax.MyTarget"] = {publisherId = "com.solar2d"},
		["plugin.applovinMax.Ogury"] = {publisherId = "com.solar2d"},
		["plugin.applovinMax.Pangle"] = {publisherId = "com.solar2d"},
		["plugin.applovinMax.Smaato"] = {publisherId = "com.solar2d"},
		["plugin.applovinMax.Tapjoy"] = {publisherId = "com.solar2d"},
		["plugin.applovinMax.UnityAds"] = {publisherId = "com.solar2d"},
		["plugin.applovinMax.Vungle"] = {publisherId = "com.solar2d"},


	},
}
``````

</div>

<div id="cleartext">

##### Android Cleartext

Some adapters require you to add a `network_security_config.xml` your `AndroidResources/res/xml` folder. If some or none of these folders exist, please add them to your project.

``````{ brush="xml" gutter="false" first-line="1"  }
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>

    <!-- For AdColony and Smaato, this permits all cleartext traffic: -->
    <base-config cleartextTrafficPermitted="true">
        <trust-anchors>
            <certificates src="system"/>
        </trust-anchors>
    </base-config>
    <!-- End AdColony / Smaato section -->

    <domain-config cleartextTrafficPermitted="true">

        <!-- For Meta Audience Network, this permits cleartext traffic to localhost: -->
        <domain includeSubdomains="true">127.0.0.1</domain>
        <!-- End Meta Audience Network section -->

    </domain-config>
</network-security-config>
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

* [View on GitHub](https://github.com/solar2d/com.solar2d-plugin.applovinMax/tree/master/src/Corona)
