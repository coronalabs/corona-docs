# fuse.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, monetization, fuse
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Fuse platform lets you give each of your users a great experience, optimize monetization across <nobr>in-app</nobr> purchases and ads, and grow engagement.

For more information on the overall Fuse <nobr>player-centric</nobr> platform, see [www.fusepowered.com/corona](http://www.fusepowered.com/corona).


## Fuse Registration

To request an account, please access the Fuse [dashboard](https://dashboard.fusepowered.com/).


## Syntax

	local fuse = require( "plugin.fuse" )


## Functions

#### [fuse.init()][plugin.fuse.init]

#### [fuse.show()][plugin.fuse.show]

#### [fuse.checkLoaded()][plugin.fuse.checkLoaded]

#### [fuse.checkContent()][plugin.fuse.checkContent]

#### [fuse.getProperty()][plugin.fuse.getProperty]

#### [fuse.load()][plugin.fuse.load]

#### [fuse.register()][plugin.fuse.register]


## Events

#### [adsRequest][plugin.fuse.event.adsRequest]


<a id="projsettings"></a>

## Project Settings

To use this plugin, add two entries into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.fuse"] =
		{
			publisherId = "com.coronalabs"
		},
		["plugin.fuse.ads"] =
		{
			publisherId = "com.coronalabs"
		},
	},		
}
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

``````lua
	android =
	{
		usesPermissions =
		{
			"android.permission.INTERNET",
			"android.permission.ACCESS_NETWORK_STATE",
			"android.permission.ACCESS_WIFI_STATE",
			"android.permission.WRITE_EXTERNAL_STORAGE",
			"com.android.vending.BILLING",
			"com.google.android.c2dm.permission.RECEIVE",
			".permission.C2D_MESSAGE",
			"android.permission.GET_ACCOUNTS",
			"android.permission.RECEIVE_BOOT_COMPLETED"
		},
	},
``````

</div>


## Enterprise

If you're using Corona Enterprise for iOS, ensure that the following static libraries are linked:

* `libplugin_fuse.a`
* `libFuseAds.a`


## Support

* [https://www.fusepowered.com/contact/](https://www.fusepowered.com/contact/)
* [Corona Forums](http://forums.coronalabs.com/forum/646-fusepowered/)
