# peanutlabs.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Peanut Labs
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

<div class="float-right" style="max-width: 240px; clear: both;">

![][images.docs.plugin-screenshot-peanutlabs]

</div>

The [Peanut Labs](http://peanutlabs.com) plugin allows developers to monetize their mobile app with Peanut&nbsp;Labs surveys.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Peanut Labs requires that you integrate their <nobr>server-side</nobr> callback and store the data from the callback in a database on your server. You can then retrieve the data from the app to verify if a user earned a reward.

Please see our [server setup][plugin.peanutlabs.server] examples as a guideline for getting started.

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This plugin is only compatible with the following firmware versions:

* iOS 8.0 and higher
* Android 4.1 and higher

</div>


## Registration

Before you can use this plugin, you must [register](https://www.peanutlabs.com/js/pubdash/bin/#/register/company) with Peanut&nbsp;Labs.


## Syntax

	local peanutlabs = require( "plugin.peanutlabs" )


## Functions

#### [peanutlabs.init()][plugin.peanutlabs.init]

#### [peanutlabs.show()][plugin.peanutlabs.show]


## Events

#### [adsRequest][plugin.peanutlabs.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.peanutlabs"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

In addition, please add the appropriate OS version restrictions specified below to prevent your <nobr>Peanutlabs-enabled</nobr> apps from being installed on incompatible devices:

``````lua
settings =
{
	android =
	{
		minSdkVersion = "16"
	},
}
``````

<!--- Include ATS "override" template block --->
TEMPLATE_ATS
<!--- --->

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

On devices running Android 6.0 and higher, this plugin requires the `STORAGE` [permission group](http://developer.android.com/reference/android/Manifest.permission_group.html#STORAGE) for caching of video ads. For details on requesting permissions at runtime, please see [here][api.library.native.showPopup#requestAppPermission].

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`

</div>


## Support

* [http://peanutlabs.com](http://peanutlabs.com)
* [Corona Forums](http://forums.coronalabs.com/forum/545-monetization-in-app-purchases-ads-etc/)
