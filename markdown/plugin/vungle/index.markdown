# vungle.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The Vungle plugin offers easy integration of Vungle video ads.


## Registration

Using Vungle video ads requires a free account &mdash; please [register](https://dashboard.vungle.com/dashboard/) before proceeding.


## Functions

#### [vungle.init()][plugin.vungle.init]

#### [vungle.load()][plugin.vungle.load]

#### [vungle.show()][plugin.vungle.show]

<s>

#### [vungle.hide()][plugin.vungle.hide]

</s>

#### [vungle.getVersionString()][plugin.vungle.getVersionString]


## Events

#### [adsRequest][plugin.vungle.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.vungle"] =
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
* [Get Started with Vungle SDK 5 - Corona](https://support.vungle.com/hc/en-us/articles/115000468771)
* [https://v.vungle.com/](https://v.vungle.com)
