# appsflyer.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, AppsFlyer
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview


The [AppsFlyer](https://www.appsflyer.com) is the world's leading mobile attribution & marketing analytics platform, helping app marketers around the world make better decisions.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Check out init parameter `hasUserConsent` and also `setHasUserConsent` method to enable GDPR data collection restrictions.

</div>

## Registration

Before using this plugin, you'll need to [register](https://www.appsflyer.com/get-started) with AppsFlyer to receive an app&nbsp;ID and Developer Key.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

According to Facebook's privacy policy, AppsFlyer (or any other 3rd party mobile measurement partner) cannot provide user-level attribution for Facebook installs unless you accept Facebook's [Terms of Service](https://www.facebook.com/ads/manage/advanced_mobile_measurement/tos). More info [here](https://support.appsflyer.com/hc/en-us/articles/207033826).

If you choose not to accept the Terms of Service, Facebook Mobile Ads installs are categorized as ‘Organic’ and you are unable to receive the user level data for Facebook installs.

</div>


## Syntax

	local appsflyer = require( "plugin.appsflyer" )


## Functions

#### [appsflyer.init()][plugin.appsflyer.init]

#### [appsflyer.logEvent()][plugin.appsflyer.logEvent]

#### [appsflyer.getVersion()][plugin.appsflyer.getVersion]

#### [appsflyer.setHasUserConsent()][plugin.appsflyer.setHasUserConsent]

#### [appsflyer.logPurchase()][plugin.appsflyer.logPurchase]

#### [appsflyer.getAppsFlyerUID()][plugin.appsflyer.getAppsFlyerUID]


## Events

#### [analyticsRequest][plugin.appsflyer.event.analyticsRequest]


## Project Settings

To use this plugin, add the following entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.appsflyer"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

For iOS, when submitting your app to the App&nbsp;Store, follow these guidelines:

* Make sure you select __yes__ when asked if your app uses the Advertising&nbsp;Identifier (IDFA).
* Ensure that the __Attribute this app installation to previously served advertisement__ box is checked.
* For installs from iOS to be counted, the app must be installed from the Apple App Store.

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`
* `"android.permission.ACCESS_NETWORK_STATE"`
* `"android.permission.ACCESS_WIFI_STATE"`

</div>

