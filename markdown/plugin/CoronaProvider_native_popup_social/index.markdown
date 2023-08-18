# Social Popup

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [CoronaProvider][api.type.CoronaProvider]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, showPopup, social
> __Platforms__			Android
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Social Popup plugin enables you to post a message to various social providers.

<div class="docs-tip-outer docs-tip-color-alert" style="width: 100%;">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

For iOS 8 and later, you have to use [Activity Popup][plugin.CoronaProvider_native_popup_activity] plugin.

</div>
</div>


## Functions

#### [native.showPopup()][plugin.CoronaProvider_native_popup_social.showPopup]
#### [native.canShowPopup()][plugin.CoronaProvider_native_popup_social.canShowPopup]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["CoronaProvider.native.popup.social"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````
