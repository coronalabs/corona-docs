
# native.showWebPopup()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          web view, web popup, web overlay
> __See also__          [native.newWebView()][api.library.native.newWebView]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a web popup that loads a local or remote web page.

## Gotchas

### General

* Only one web popup object can be displayed at a time. For multiple web views at once, see [native.newWebView()][api.library.native.newWebView].

* The web popup is not part of the OpenGL canvas and does not obey the display object hierarchy, so it will always appear in front of normal display objects including images, text, and vector objects.

* Web popups are not supported on tvOS.

* Web popup objects cannot be moved or resized.

### iOS

On iOS, when checking for `event.errorMessage` in a web popup listener, you may occasionally receive an error message such as `NSURLerrorDomain error -999`. This is returned when an asynchronous load is cancelled. A Web Kit framework delegate will receive this error when it performs a cancel operation on a loading resource, however a `NSURLConnection` or `NSURLDownload` delegate will not receive this error if the download is cancelled. This event/error may occur if a link within the web popup is clicked while the web popup is still in the process of loading the first page. Generally speaking, this error can be ignored.

### Android

If the web popup is displaying web pages from the Internet, you must add the `INTERNET` permission to the `build.settings` file. This permission is unnecessary if the web popup will only be displaying local HTML files that do not access the Internet.

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


## Syntax

	native.showWebPopup( [x, y, width, height,] url, [options] )

##### x ~^(optional)^~
_[Number][api.type.Number]._ The __x__ coordinate that corresponds to the left edge of the web popup.

##### y ~^(optional)^~
_[Number][api.type.Number]._ The __y__ coordinate that corresponds to the top edge of the web popup.

##### width ~^(optional)^~
_[Number][api.type.Number]._ Width of the web popup.

##### height ~^(optional)^~
_[Number][api.type.Number]._ Height of the web popup.

##### url ~^(required)^~
_[String][api.type.String]._ URL of the local or remote web page (including extension for a local URL). By default, the URL is assumed to be an absolute URL to a remote server. If `x`, `y`, `width`, `height` are not specified, the popup occupies the entire screen.

##### options ~^(optional)^~
_[Table][api.type.Table]._ Table containing additional parameters for the popup &mdash; see the next section for details.


## Options Reference

This is an optional table you can pass containing additional options for the web popup.

``````lua
local options =
{
	baseUrl = system.ResourceDirectory,  -- Default is nil
	hasBackground = false,  -- Default is true; not supported on Windows
	autoCancel = false,  -- Default is true; only supported on Android
	urlRequest = listener_function  -- Default is nil
}
``````

##### baseUrl ~^(optional)^~
_[String][api.type.String] or [Constant][api.type.Constant]._ Determines whether the URL parameter to `native.showWebPopup()` is interpreted as a relative or absolute URL.

* By default, `nil` means the URL is absolute.
* To refer to a local file instead, set the base URL to one of the base directory constants, for example `system.ResourceDirectory`. Then the URL parameter is relative to that base directory.
* For remote files, you can also specify a remote base, and the URL parameter will be relative to the remote base.

##### hasBackground ~^(optional)^~
_[Boolean][api.type.Boolean]._ Controls whether the popup has a an opaque background or not. If not specified, the background will be opaque (`true`). This option is not supported on Windows (background&nbsp;cannot be&nbsp;transparent).

##### autoCancel ~^(optional)^~
_[Boolean][api.type.Boolean]._ Sets up the popup to be automatically closed when the Android back key has been pressed and there is no more web history to navigate to. This is `true` by default.

##### urlRequest ~^(optional)^~
_[Function][api.type.Function]._ Designates a listener function that will intercept all [urlRequest][api.event.urlRequest] events from the popup. This also provides a standard method for passing information back from a web page using <nobr>pseudo-URLs.</nobr> For&nbsp;example:

<div class="code-indent" style="width: 400px;">

`````html
<form action="corona:close" />
	<input type="submit" />
</form>
`````

</div>

In this example, when the user clicks __Submit__ in the web popup, the designated listener function is sent a [urlRequest][api.event.urlRequest] event object with its URL property set to `"corona:close"`, thus allowing the application to react appropriately. Note that the listener function must return `true` or the web popup will close. Without a return statement, `false` is assumed.


## Example

`````lua
local function listener( event )
	local shouldLoad = true

	local url = event.url
	if 1 == string.find( url, "corona:close" ) then
		-- Close the web popup
		shouldLoad = false
	end

	if event.errorCode then
		-- Error loading page
		print( "Error: " .. tostring( event.errorMessage ) )
		shouldLoad = false
	end

	return shouldLoad
end
 
local options =
{
	hasBackground = false,
	baseUrl = system.DocumentsDirectory,
	urlRequest = listener
}
native.showWebPopup( 50, 100, 220, 300, "localpage1.html", options )
`````
