# superawesome.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, SuperAwesome
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The SuperAwesome plugin allows developers to monetize their mobile app with SuperAwesome banner, static interstitial, and video interstitial ads.


## Registration

Before you can use this plugin, you must [register](http://dashboard.superawesome.tv/) with SuperAwesome.


## Syntax

	local superawesome = require( "plugin.superawesome" )


## Functions

#### [superawesome.init()][plugin.superawesome.init]

#### [superawesome.load()][plugin.superawesome.load]

#### [superawesome.show()][plugin.superawesome.show]

#### [superawesome.hide()][plugin.superawesome.hide]

#### [superawesome.isLoaded()][plugin.superawesome.isLoaded]


## Events

#### [adsRequest][plugin.superawesome.event.adsRequest]


## Project Settings

To use this plugin, add two entries into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.superawesome"] =
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
* `"android.permission.ACCESS_NETWORK_STATE"`

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

On devices running Android 6.0 and higher, this plugin requires the `STORAGE` permission group to be granted at runtime for caching of video ads. If the permission is not granted, the app will stream video content instead of preloading/caching it. To request permissions at runtime, please see [here][api.library.native.showPopup#requestapppermission].

</div>


## Support

* [http://dashboard.superawesome.tv/](http://dashboard.superawesome.tv/)
* [Corona Forums](http://forums.coronalabs.com/forum/545-monetization-in-app-purchases-ads-etc/)
