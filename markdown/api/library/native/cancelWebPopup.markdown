
# native.cancelWebPopup()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          web popup, web overlay
> __See also__          [native.showWebPopup()][api.library.native.showWebPopup]
>								[native.newWebView()][api.library.native.newWebView]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Dismisses the currently displaying web popup. This function takes no arguments because only one web popup can be shown at one time (not to be confused with [native web views][api.library.native.newWebView] which can have multiple instances shown at once).


## Syntax

	native.cancelWebPopup()


## Example

`````lua
local options =
{
	hasBackground=false,
	baseUrl=system.DocumentsDirectory
}
native.showWebPopup( "localpage1.html", options )

-- close popup after 3 seconds
timer.performWithDelay( 3000, function() native.cancelWebPopup() end, 1 )
`````
