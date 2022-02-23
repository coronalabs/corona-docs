# kochava.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Kochava
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview


The [Kochava](https://kochava.com/) plugin allows you to integrate the Kochava&nbsp;SDK for leveraging hundreds of ad network and publisher partners. This limits the number of <nobr>third-party</nobr> SDKs required to run a successful UA strategy while greatly reducing complexity during update cycles.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Check out new init parameters `hasUserConsent` and `intelligentConsentManagement`, also `setHasUserConsent` method and new event type `consent` to enable GDPR data collection restrictions.

Intelligent Consent Management is an opt-in feature and must be enabled both in the app and on the Edit App page of the Kochava Dashboard in order to function for this new functional to work.

</div>

## Registration

Before using this plugin, you'll need to [register](https://www.kochava.com/sign-up/) with Kochava to receive an app&nbsp;ID.


## Syntax

	local kochava = require( "plugin.kochava" )


## Functions

#### [kochava.init()][plugin.kochava.init]

#### [kochava.logEvent()][plugin.kochava.logEvent]

#### [kochava.logDeeplinkEvent()][plugin.kochava.logDeeplinkEvent]

#### [kochava.setIdentityLink()][plugin.kochava.setIdentityLink]

#### [kochava.getAttributionData()][plugin.kochava.getAttributionData]

#### [kochava.limitAdTracking()][plugin.kochava.limitAdTracking]

#### [kochava.getVersion()][plugin.kochava.getVersion]

#### [kochava.setHasUserConsent()][plugin.kochava.setHasUserConsent]


## Events

#### [analyticsRequest][plugin.kochava.event.analyticsRequest]


## Project Settings

To use this plugin, add the following entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.kochava"] =
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

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`
* `"android.permission.ACCESS_NETWORK_STATE"`
* `"android.permission.ACCESS_WIFI_STATE"`

</div>


## Support

* [Email](mailto:corona@kochava.com)
* [Corona Forums](http://forums.coronalabs.com/forum/631-corona-premium-plugins/)
