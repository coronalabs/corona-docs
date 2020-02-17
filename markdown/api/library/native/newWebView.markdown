
# native.newWebView()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      [WebView][api.type.WebView]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          web view, website, web overlay
> __See also__          [native.showWebPopup()][api.library.native.showWebPopup]
>						[urlRequest][api.event.urlRequest]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Loads a web page in a web view container. This native web view can be moved via `x`/`y` properties in the same manner as other display objects. On iOS, you can also rotate it via the `rotation` property.

This API supports loading from either a local file containing HTML content (in&nbsp;one of the system directories) or from a remote website.

## Gotchas

### General

* Native web views are not part of the OpenGL canvas and do not obey the display object hierarchy, so they will always appear in front of normal display objects including images, text, and vector objects.

* This API should not be confused with the similar (older) [native.showWebPopup()][api.library.native.showWebPopup].

* You must close a web view by calling the `removeSelf()` method, because returning false in the listener function has no effect (with [web&nbsp;popups][api.library.native.showWebPopup], which are different from web views, returning `false` in the listener closes the web popup&mdash;this is not the case with native web views).

* Native web views are not supported on tvOS.

* Native web views can only be rotated via the `rotation` property on iOS.

### iOS

On iOS, when checking for `event.errorMessage` in a web view listener, you may occasionally receive an error message such as <nobr>`NSURLerrorDomain error -999`</nobr>. This is returned when an asynchronous load is cancelled. A Web Kit framework delegate will receive this error when it performs a cancel operation on a loading resource, however a `NSURLConnection` or `NSURLDownload` delegate will not receive this error if the download is cancelled. This event/error may occur if a link within web view is clicked while the web view is still in the process of loading the first page. Generally speaking, this error can be ignored.

### Android

* If the web popup is displaying web pages from the Internet, then you must add the `INTERNET` permission to the `build.settings` file. This permission is unnecessary if the web view will only be displaying local HTML files that do not access the Internet.

<div class="code-indent">

``````lua
settings =
{
	android =
	{
		usesPermissions =
		{
			"android.permission.INTERNET",
		},
	},
}
``````
</div>

## Syntax

	native.newWebView( x, y, width, height )

##### x ~^(required)^~
_[Number][api.type.Number]._ The __x__ coordinate that corresponds to the center of the web view object.

##### y ~^(required)^~
_[Number][api.type.Number]._ The __y__ coordinate that corresponds to the center of the web view object.

##### width ~^(required)^~
_[Number][api.type.Number]._ Width of the web view object.

##### height ~^(required)^~
_[Number][api.type.Number]._ Height of the web view object.


## Properties / Methods

See the [WebView][api.type.WebView] documentation for a list of methods and properties.


## Events

See the [urlRequest][api.event.urlRequest] event documentation for properties related to various [WebView][api.type.WebView] object events.


## Examples

##### Basic Web View

`````lua
local webView = native.newWebView( display.contentCenterX, display.contentCenterY, 320, 480 )
webView:request( "http://www.coronalabs.com/" )
-- or
webView:request( "localfile.html", system.ResourceDirectory )
`````

##### Same + Response From Callback Listener

`````lua
local function webListener( event )
    if event.url then
        print( "You are visiting: " .. event.url )
    end
 
    if event.type then
        print( "The event.type is " .. event.type ) -- print the type of request
    end
 
    if event.errorCode then
        native.showAlert( "Error!", event.errorMessage, { "OK" } )
    end
end
 
local webView = native.newWebView( display.contentCenterX, display.contentCenterY, 320, 480 )
webView:request( "http://www.coronalabs.com/" )
 
webView:addEventListener( "urlRequest", webListener )
`````
