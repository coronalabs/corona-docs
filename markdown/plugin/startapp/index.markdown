
# startapp.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, StartApp
> __Platforms__			Android
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The StartApp plugin allows developers to monetize users through StartApp static interstitial ads, video interstitial ads, rewarded video ads, splash ads, return ads and banner ads.


## Registration

Before you can use this plugin, you must [register](https://portal.startapp.com/#/signup) with StartApp.


## Syntax

	local startapp = require( "plugin.startapp" )


## Functions

#### [startapp.init()][plugin.startapp.init]

#### [startapp.load()][plugin.startapp.load]

#### [startapp.show()][plugin.startapp.show]

#### [startapp.hide()][plugin.startapp.hide]

#### [startapp.showSplash()][plugin.startapp.showSplash]

#### [startapp.isLoaded()][plugin.startapp.isLoaded]

#### [startapp.setUserConsent()][plugin.startapp.setUserConsent]


## Events

#### [adsRequest][plugin.startapp.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.startapp"] =
		{
			publisherId = "com.startapp"
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
