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

This function allows you to __set__ properties of the underlying native object created by the [native][api.library.native] library. For example, if you create a [WebView][api.type.WebView] on iOS, you can set the Obj-C properties of the corresponding `UIWebView`.

## Gotchas

This is an iOS-only feature.

## Syntax

	object:setNativeProperty( property, value )

##### property ~^(required)^~
_[String][api.type.String]._ The string name for the native property.

##### value ~^(required)^~
The value to set the property to. Must be a Lua value compatible with <nobr>Obj-C</nobr>. The following Lua values are converted to the corresponding values in <nobr>Obj-C</nobr>: [boolean][api.type.Boolean], [string][api.type.String], [array][api.type.Array], [table][api.type.Table], and [number][api.type.Number].

## Example

`````lua
local webView = native.newWebView( 0, 0, display.contentWidth, display.contentHeight )
webView:setNativeProperty( "allowsInlineMediaPlayback", true )
`````