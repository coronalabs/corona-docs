# native.canShowPopup() — Safari View

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, canShowPopup, safari, safariView, webView
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns whether or not the popup type can be shown.


## Syntax

	native.canShowPopup( name )

##### name ~^(required)^~
_[String][api.type.String]._ The string name of the popup to be shown. For the Safari View plugin, use `"safariView"`.

## Example

``````lua
if native.canShowPopup( "safariView" ) then
	native.showPopup( "safariView", "https://coronalabs.com" )
end
``````