# steamworks.showWebOverlay()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, overlay, showWebOverlay
> __See also__          [steamworks.canShowOverlay][plugin.steamworks.canShowOverlay]
>                       [steamworks.showGameOverlay()][plugin.steamworks.showGameOverlay]
>                       [steamworks.showUserOverlay()][plugin.steamworks.showUserOverlay]
>                       [steamworks.showStoreOverlay()][plugin.steamworks.showStoreOverlay]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays a Steam overlay on top of the application window. This overlay shows Steam's <nobr>built-in</nobr> web browser. You can use it to display a particular web page.

Returns `true` if Steam is able to display the overlay.


## Gotchas

This function will return `false`&nbsp;&mdash; and the overlay will not show&nbsp;&mdash; in the following cases:

* Invalid arguments were specified.
* The [steamworks.canShowOverlay][plugin.steamworks.canShowOverlay] property is `false`.
* The [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`, indicating that the application is not currently connected to the Steam client.
* The Steam client is not currently running.
* User has disabled overlays in the Steam client's <nobr>__In-Game__</nobr> settings screen.
* During the first few seconds of app startup. This is normal behavior since the Steam client needs time to bind to the application process.


## Syntax

	steamworks.showWebOverlay( [url] )

##### url ~^(optional)^~
_[String][api.type.String]._ The URL to load in the overlay's web browser. If you do not provide a URL argument, the overlay will show the web browser's last displayed page.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Attempt to show our home page within the application
local wasShown = steamworks.showWebOverlay( "https://coronalabs.com" )

if not wasShown then
	print( "Failed to display the overlay." )
end
``````
