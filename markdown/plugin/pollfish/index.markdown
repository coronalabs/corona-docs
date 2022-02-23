
# pollfish.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Pollfish
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

<div class="float-right" style="max-width: 240px; clear: both;">

![][images.docs.plugin-screenshot-pollfish]

</div>

[Pollfish](https://www.pollfish.com/) is a survey platform that delivers online surveys through mobile apps. It can be used along with any other ad platform to bring an extra source of revenue. You can also create internal surveys for free and ask questions to your app's users to improve your application.


## Registration

Before you can use this plugin, you must [register](https://www.pollfish.com/publisher) with Pollfish.


## Syntax

	local plugin = require( "plugin.pollfish" )


## Functions

#### [pollfish.init()][plugin.pollfish.init]

#### [pollfish.load()][plugin.pollfish.load]

#### [pollfish.show()][plugin.pollfish.show]

#### [pollfish.hide()][plugin.pollfish.hide]

#### [pollfish.isLoaded()][plugin.pollfish.isLoaded]

#### [pollfish.setUserDetails()][plugin.pollfish.setUserDetails]


## Events

#### [adsRequest][plugin.pollfish.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.pollfish"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`

In addition, if you wish to receive <nobr>highly-targeted</nobr> surveys in your app and increase your chances for higher revenue, you can include any or all of the following permissions:

* `"android.permission.ACCESS_WIFI_STATE"`
* `"android.permission.READ_PHONE_STATE"`
* `"android.permission.ACCESS_NETWORK_STATE"`
* `"android.permission.ACCESS_FINE_LOCATION"`
* `"android.permission.ACCESS_COARSE_LOCATION"`

</div>


## Support

* [https://www.pollfish.com/contact](https://www.pollfish.com/contact)
* [Corona Forums](http://forums.coronalabs.com/forum/545-monetization-in-app-purchases-ads-etc/)
