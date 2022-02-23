# admob.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The AdMob plugin allows developers to monetize users through AdMob static interstitial ads, video interstitial ads, rewarded video ads, and banner ads.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Check out new `hasUserConsent`  [admob.load()][plugin.admob.load] parameter to enable GDPR data collection restrictions.

</div>


## Registration

Before you can use this plugin, you must [register](https://www.google.com/admob/) with AdMob.


## Syntax

	local admob = require( "plugin.admob" )


## Functions

#### [admob.init()][plugin.admob.init]

#### [admob.load()][plugin.admob.load]

#### [admob.isLoaded()][plugin.admob.isLoaded]

#### [admob.show()][plugin.admob.show]

#### [admob.hide()][plugin.admob.hide]

#### [admob.height()][plugin.admob.height]

#### [admob.setVideoAdVolume()][plugin.admob.setVideoAdVolume]


## Events

#### [adsRequest][plugin.admob.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8,9,10,11,15,16,17,18,19,20,21,22,26,27,28,29,30]" }
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
		plist = {
			GADApplicationIdentifier = "[YOUR_ADMOB_APP_ID]",
			SKAdNetworkItems = {
				{
					SKAdNetworkIdentifier = "cstr6suwn9.skadnetwork",
				},
			},
		},
	},
	plugins =
	{
		["plugin.admob"] =
		{
			publisherId = "com.coronalabs"
		},
		-- See: http://docs.coronalabs.com/plugin/att
	},
}
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Add [App Tracking Transparency][plugin.att] plugin to your project as well.

</div>


<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If you are building for Android, you should __remove__ any legacy inclusion of the `["plugin.google.play.services"]` plugin from your `build.settings`.

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`
* `"android.permission.ACCESS_NETWORK_STATE"`

</div>


## Google AdMob Mediation setup

AdMob plugin can be used to serve ads from other networks to give your monetization a boost on Android.

To use this feature, you would have to connect each individual network manually using AdMob interface. List of available networks with links to set up instructions can be found [here](https://developers.google.com/admob/android/mediate#mediation-networks).

Most of the networks would have "Import the SDK and adapter" step. To implement it, add Gradle dependencies to special file `corona.gradle` within `AndroidResource` directory inside your Solar2D Project.

For example, to use Facebook and AppLoving networks contents of the `AndroidResources/corona.gradle` file should be:

```
dependencies {
    implementation 'com.google.ads.mediation:facebook:6.2.0.0'
    implementation 'com.google.ads.mediation:applovin:9.14.5.0'
}
```

## Sample project

* [View on GitHub](https://github.com/coronalabs/plugins-sample-admob)
