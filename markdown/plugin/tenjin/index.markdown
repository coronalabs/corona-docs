# tenjin.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Tenjin
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The [Tenjin](https://tenjin.io/) plugin is used for advertising analytics, also known as __attribution__. It helps studios who run multiple advertising campaigns for their apps understand where their users are coming from. With this information, they can see the effectiveness of their spending and optimize their campaigns accordingly.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Check out new `hasUserConsent` init parameter to enable GDPR data collection restrictions.

</div>


## Registration

Before using this plugin, you'll need to [register](https://www.tenjin.io/sign_up) with Tenjin to receive an API&nbsp;key.


## Syntax

	local tenjin = require( "plugin.tenjin" )


## Functions

#### [tenjin.init()][plugin.tenjin.init]

#### [tenjin.logEvent()][plugin.tenjin.logEvent]

#### [tenjin.logPurchase()][plugin.tenjin.logPurchase]

#### [tenjin.getDeepLink()][plugin.tenjin.getDeepLink]

#### [tenjin.updateConversionValue()][plugin.tenjin.updateConversionValue]

## Events

#### [analyticsRequest][plugin.tenjin.event.analyticsRequest]

#### [deepLinkRequest][plugin.tenjin.event.deepLinkRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.tenjin"] =
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

</div>


## Support

* [Email](mailto:support@tenjin.com)
* [Corona Forums](http://forums.coronalabs.com/forum/631-corona-premium-plugins/)
