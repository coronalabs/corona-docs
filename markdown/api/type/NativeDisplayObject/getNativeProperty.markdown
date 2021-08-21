# object:getNativeProperty()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Object__			[NativeDisplayObject][api.type.NativeDisplayObject]
> __Library__			[native.*][api.library.native]
> __Return value__		Lua values compatible with Obj-C
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			native object, property accessors
> __See also__			[object:setNativeProperty()][api.type.NativeDisplayObject.setNativeProperty]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function allows you to __get__ properties of the underlying native object created by the [native][api.library.native] library. For example, if you create a [WebView][api.type.WebView] on iOS, you can access the <nobr>Obj-C</nobr> properties of the corresponding `WKWebView` (or `WKWebViewConfiguration` if called before a request is made).

## Gotchas

This is an iOS-only feature.

## Syntax

	object:getNativeProperty( property )

##### property ~^(required)^~
_[String][api.type.String]._ The string name for the native property.

## Example

`````lua
local webView = native.newWebView( 0, 0, display.contentWidth, display.contentHeight )
local allows = webView:getNativeProperty( "allowsInlineMediaPlayback" )
`````