# Quick Look

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [CoronaProvider][api.type.CoronaProvider]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, showPopup, quick look, preview
> __Platforms__			iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Quick Look plugin enables you to preview/view documents on iOS via the [native.showPopup()][plugin.CoronaProvider_native_popup_quickLook.showPopup] API.


## Functions

#### [native.showPopup()][plugin.CoronaProvider_native_popup_quickLook.showPopup]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["CoronaProvider.native.popup.quickLook"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````


## Support

* [Forums](https://forums.solar2d.com/c/corona-marketplace/corona-premium-plugins/92)

## Sample project

* [View on GitHub](https://github.com/coronalabs/plugins-source-native-popup-quicklook/tree/master/Corona)

## Source code

* [View on GitHub](https://github.com/coronalabs/plugins-source-native-popup-quicklook)
