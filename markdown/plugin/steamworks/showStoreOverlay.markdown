# steamworks.showStoreOverlay()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, overlay, showStoreOverlay
> __See also__          [steamworks.canShowOverlay][plugin.steamworks.canShowOverlay]
>                       [steamworks.showGameOverlay()][plugin.steamworks.showGameOverlay]
>                       [steamworks.showUserOverlay()][plugin.steamworks.showUserOverlay]
>                       [steamworks.showWebOverlay()][plugin.steamworks.showWebOverlay]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays a Steam overlay on top of the application window. This overlay shows a web page displaying information about one particular game on the Steam store. You would normally use this function to advertise other games on Steam.

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

	steamworks.showStoreOverlay( [appId] )

##### appId ~^(optional)^~
_[String][api.type.String]._ Unique string ID of the application assigned by Steam. The overlay will show this application's web page on the Steam store. If you do not provide this argument, the overlay will display the currently running application's store page.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Attempt to show this game's Steam store web page as an overlay
local wasShown = steamworks.showStoreOverlay()

if not wasShown then
	print( "Failed to display the overlay." )
end
``````
