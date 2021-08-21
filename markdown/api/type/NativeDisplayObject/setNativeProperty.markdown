# object:setNativeProperty()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Object__			[NativeDisplayObject][api.type.NativeDisplayObject]
> __Library__			[native.*][api.library.native]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			native object, property accessors
> __See also__			[object:getNativeProperty()][api.type.NativeDisplayObject.getNativeProperty]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function allows you to __set__ properties of the underlying native object created by the [native][api.library.native] library. For example, if you create a [WebView][api.type.WebView] on iOS, you can set the Obj-C properties of the corresponding [`WKWebView`](https://developer.apple.com/documentation/webkit/wkwebview?language=objc) or [`WKWebViewConfiguration`](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration?language=objc) if called before a request is made. Similarly on Android it can set properties of [`WebView`](https://developer.android.com/reference/android/webkit/WebView) or [`WebSettings`](https://developer.android.com/reference/android/webkit/WebSettings)

## Syntax

	object:setNativeProperty( property, value )

##### property ~^(required)^~
_[String][api.type.String]._ The string name for the native property.

##### value ~^(required)^~
The value to set the property to. Must be a Lua value compatible with <nobr>Obj-C</nobr> or Java. The following Lua values are converted to the corresponding values in <nobr>Obj-C</nobr>: [boolean][api.type.Boolean], [string][api.type.String], [array][api.type.Array], [table][api.type.Table], and [number][api.type.Number]. Java supported types are [boolean][api.type.Boolean], [string][api.type.String] and [number][api.type.Number].

Android also supports special pair of values for WebView: property `"http.agent"` and value `"system"` to set WebView user agent to system default.

## Example

`````lua
local webView = native.newWebView( 0, 0, display.contentWidth, display.contentHeight )
if system.getInfo("platform") == "android" then
	webView:setNativeProperty("http.agent", "system")
	webView:setNativeProperty("setBuiltInZoomControls", false)
else
	webView:setNativeProperty( "allowsInlineMediaPlayback", true )
end
webView:request( "https://www.solar2d.com" )
`````