# fbAudienceNetwork.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Facebook Audience Network, fbAudienceNetwork
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The Facebook Audience Network plugin allows developers to monetize their mobile app with Facebook banner, rewarded and static interstitial ads.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Facebook has a method for calling test ads which is different from other CORONA_CORE_PRODUCT ad providers. To test ads during implementation of this plugin, you must follow their requirements. Please read the notes in the [fbAudienceNetwork.init()][plugin.fbAudienceNetwork.init] documentation and follow the steps to enable test ads.

</div>


## Registration

Before you can use the Facebook Audience Network, you must set up [Audience Network](https://developers.facebook.com/docs/audience-network/getting-started) in your app.


## Syntax

<div id="example">

##### Facebook Audience Network

	local fbAudienceNetwork = require( "plugin.fbAudienceNetwork" )

</div>


## Functions

#### [fbAudienceNetwork.init()][plugin.fbAudienceNetwork.init]

#### [fbAudienceNetwork.show()][plugin.fbAudienceNetwork.show]

#### [fbAudienceNetwork.hide()][plugin.fbAudienceNetwork.hide]

#### [fbAudienceNetwork.getSize()][plugin.fbAudienceNetwork.getSize]

#### [fbAudienceNetwork.isLoaded()][plugin.fbAudienceNetwork.isLoaded]

#### [fbAudienceNetwork.load()][plugin.fbAudienceNetwork.load]


## Events

#### [adsRequest][plugin.fbAudienceNetwork.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

<div id="example">

##### Facebook Audience Network

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	iphone =
	{
		plist = {
			SKAdNetworkItems = {
				{ SKAdNetworkIdentifier = "v9wttpbfk9.skadnetwork" },
				{ SKAdNetworkIdentifier = "n38lu8286q.skadnetwork" },
			},
		},
	},
	plugins =
	{
		["plugin.fbAudienceNetwork"] =
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
* `"android.permission.ACCESS_WIFI_STATE"`

</div>

## Sample project

* [View on GitHub](https://github.com/coronalabs/plugins-sample-fbAudienceNetwork)
