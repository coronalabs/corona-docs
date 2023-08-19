# Activity Popup

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [CoronaProvider][api.type.CoronaProvider]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, showPopup, activity
> __Platforms__			iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Activity Popup plugin displays the activity popup window which corresponds to `UIActivityViewController` on iOS.

<div class="docs-tip-outer docs-tip-color-alert" style="width: 100%;">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

For Android, you have to use [Social Popup][plugin.CoronaProvider_native_popup_social] plugin.

</div>
</div>

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
