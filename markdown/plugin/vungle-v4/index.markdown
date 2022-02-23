# vungle-v4.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [CoronaProvider][api.type.CoronaProvider]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This plugin uses an older version of the Vungle&nbsp;SDK. Thus, we encourage you to update to the newer [Vungle 5.1][plugin.vungle] plugin.

</div>

## Overview

The Vungle plugin offers easy integration of Vungle video ads.


## Registration

Using Vungle video ads requires a free account &mdash; please [register](https://v.vungle.com/dashboard/signup) before proceeding.


## Functions

#### [vungle-v4.init()][plugin.vungle-v4.init]

#### [vungle-v4.show()][plugin.vungle-v4.show]

<s>

#### [vungle-v4.hide()][plugin.vungle-v4.hide]

</s>

#### [vungle-v4.isAdAvailable()][plugin.vungle-v4.isAdAvailable]

#### [vungle-v4.getVersionString()][plugin.vungle-v4.getVersionString]

#### [vungle-v4.showCacheFiles()][plugin.vungle-v4.showCacheFiles]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["CoronaProvider.ads.vungle"] =
		{
			publisherId = "com.vungle"
		},
	},		
}
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`
* `"android.permission.WRITE_EXTERNAL_STORAGE"`
* `"android.permission.ACCESS_NETWORK_STATE"`

</div>


## Support

* [tech-support@vungle.com](mailto:tech-support@vungle.com)
* [https://v.vungle.com/](https://v.vungle.com)
* [Corona Forums](http://forums.coronalabs.com/forum/612-vungle/)
