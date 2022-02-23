# fuse.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, monetization, fuse
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Fuse is the only monetization platform that lets you give each of your users a great experience, optimize monetization across <nobr>in-app</nobr> purchases and ads, and grow engagement. Fuse&nbsp;Powered is 100% focused on helping publishers make more money.

For more information please visit [www.fusepowered.com/corona](http://www.fusepowered.com/corona).


## Fuse Registration

A Fuse account will be created for you automatically when you perform your first app build via Corona&nbsp;SDK build 2015.XXXX or later. Following that, you will receive an email from Fuse&nbsp;Powered with account information and instructions for logging into the Fuse dashboard. These credentials will be different from those associated with Corona&nbsp;SDK and [coronalabs.com](http://www.coronalabs.com).

If you have any issues accessing your Fuse account, please contact [INSERT_SUPPORT_INFO].

### Manual Account linking

If you happen to already have an existing Fuse account, then you will not be able to do device builds until your Fuse and Corona accounts are linked. Please contact [INSERT_SUPPORT_INFO] so we can manually link your accounts.


## Integration

If you are using Corona SDK build 2015.XXXX or later, the Fuse plugin will be automatically integrated into your app. Please proceed to the function and event documentation below to learn how to fully implement Fuse Powered functionality.


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


<div class="h2-override">

Events

## Events

</div>

#### [adsRequest][plugin.fuse.event.adsRequest]



## Project Settings

### App Key

When the Corona Simulator does a device build, the build server automatically provisions a unique app key based on the app's unique identifier (e.g. bundle identifier on iOS). 

NOTE: App keys are issued on a per-platform basis. If you deploy your app on multiple platforms, the app uses a different app key for each platform.


### Newer Daily Builds

For daily builds 2015.2618 and newer, the device build process in the Corona Simulator is seamlessly integrated with Fuse.

#### Setup

During the soft launch period, these features are temporarily hidden. You must activate them explicitly:

* On Mac, run following command from Terminal:
	+ `defaults write com.coronalabs.Corona_Simulator debugMonetizationPlugin 1`
* On Win, add a registry setting. From the Registry Editor, select the `HKEY_CURRENT_USER\Software\Ansca Corona\Corona Simulator\Preferences` setting and add a DWORD value with name `debugMonetizationPlugin` and value `1`:

![][images.simulator.win-fuse-preference]


#### Device Builds

To take full advantage of Fuse Powered functionality, ensure that monetization is enabled in the device build dialog:

![][images.simulator.device-build-dialog]


### Legacy Build Usage

If you are using a build older than 2015.2618, you must modify the `plugins` table of `build.settings`. This ensures that the build server will integrate the plugin during the build phase. 

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


## Enterprise

If you're using Corona Enterprise for iOS, ensure that the following static libraries are linked:

* `libplugin_fuse.a`
* `libFuseAds.a`

<!---

If using Corona Enterprise for Android, ...

-->


## Support

* [https://www.fusepowered.com/contact/](https://www.fusepowered.com/contact/)
* [Corona Forums](http://forums.coronalabs.com/forum/646-fusepowered/)
