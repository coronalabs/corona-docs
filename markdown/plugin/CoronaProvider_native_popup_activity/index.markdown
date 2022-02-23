# Activity Popup

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [CoronaProvider][api.type.CoronaProvider]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, showPopup, activity
> __Platforms__			iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Activity Popup plugin displays the activity popup window which corresponds to `UIActivityViewController` on iOS.


## Syntax

	local activity = require( "CoronaProvider.native.popup.activity" )


## Functions

#### [native.showPopup()][plugin.CoronaProvider_native_popup_activity.showPopup]
#### [native.canShowPopup()][plugin.CoronaProvider_native_popup_activity.canShowPopup]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["CoronaProvider.native.popup.activity"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````


## Support

* [Corona Forums](http://forums.coronalabs.com/forum/631-corona-premium-plugins/)