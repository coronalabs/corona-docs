# native.showPopup() — Safari View

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, showPopup, safari, safariView, webView
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Displays the Safari View popup which corresponds to the `SFSafariViewController`, introduced in <nobr>iOS 9</nobr> \([reference](https://developer.apple.com/library/ios/documentation/SafariServices/Reference/SFSafariViewController_Ref/index.html)\). In contrast to [native.newWebView()][api.library.native.newWebView], the Safari View shares cookies, sessions, and other browser data with the native iOS Safari app.


## Gotchas

* The Safari View can __not__ open local HTML files &mdash; all URLs must start with `http://` or `https://`.


## Syntax

	native.showPopup( name, options )

##### name ~^(required)^~
_[String][api.type.String]._ The string name of the popup to be shown. For the Safari View plugin, use `"safariView"`.

##### options ~^(required)^~
_[Table][api.type.Table]._ A table that specifies the optional properties for the popup — see the next section for details.


## Options Reference

##### url ~^(required)^~
_[String][api.type.String]._ URL of the web page. This must start with `http://` or `https://`.

##### animated ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the controller slides in; otherwise it appears instantly.

##### entersReaderIfAvailable ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, Reader mode will be entered automatically when it is available for the web page.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener which supports basic [popup events][api.event.popup]. For the event, `event.action` ([string][api.type.String]) may be one of the following:

* `"loaded"` — Initial loading is finished.
* `"failed"` — Indicates there was an error while loading the URL; the Safari View remains open.
* `"done"` — Indicates that the user pressed the "Done" button and the Safari View was closed.


## Example

``````lua
local function safariListener( event )
	if ( event.action == "failed" ) then
		print( "Error loading the URL" )
	elseif ( event.action == "loaded" ) then
		print( "Page loaded!" )
	elseif ( event.action == "done" ) then
		print( "Safari view closed" )
	end
end

local popupOptions =
{
	url = "https://coronalabs.com",
	animated = true,
	entersReaderIfAvailable = true,
	listener = safariListener
}

-- Check if the Safari View is available
local safariViewAvailable = native.canShowPopup( "safariView" )

if safariViewAvailable then
	-- Show the Safari View
	native.showPopup( "safariView", popupOptions )
end
``````
