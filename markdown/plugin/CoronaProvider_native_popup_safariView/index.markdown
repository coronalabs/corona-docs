# Safari View

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [CoronaProvider][api.type.CoronaProvider]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, showPopup, safari, safariView, webView
> __Platforms__         iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Safari View plugin lets you display a web page popup using the `SFSafariViewController`, introduced in <nobr>iOS 9</nobr>.


## Gotchas

* This plugin is only supported on <nobr>iOS 9.x</nobr> and later.

* The Safari View is not intended as a comprehensive replacement for [native.newWebView()][api.library.native.newWebView]. Its general purpose is to provide the user with a simple <nobr>in-app</nobr> popup for viewing a web page.

* In contrast to [native.newWebView()][api.library.native.newWebView], the Safari View shares cookies, sessions, and other browser data with the native iOS Safari app.

* The Safari View can __not__ open local HTML files &mdash; all URLs must start with `http://` or `https://`.


## Functions

#### [native.showPopup()][plugin.CoronaProvider_native_popup_safariView.showPopup]
#### [native.canShowPopup()][plugin.CoronaProvider_native_popup_safariView.canShowPopup]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["CoronaProvider.native.popup.safariView"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````


## Support

* [Corona Forums](http://forums.coronalabs.com/forum/631-corona-premium-plugins/)
