# steamworks.showUserOverlay()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, overlay, showUserOverlay
> __See also__          [steamworks.canShowOverlay][plugin.steamworks.canShowOverlay]
>                       [steamworks.showGameOverlay()][plugin.steamworks.showGameOverlay]
>                       [steamworks.showStoreOverlay()][plugin.steamworks.showStoreOverlay]
>                       [steamworks.showWebOverlay()][plugin.steamworks.showWebOverlay]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays a Steam overlay on top of the application window. This overlay is used to interact with or show information about another user.

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

	steamworks.showUserOverlay( userSteamId [, overlayName] )

##### userSteamId ~^(required)^~
_[String][api.type.String]._ Unique string ID of the user to interact with in the overlay.

##### overlayName ~^(optional)^~
_[String][api.type.String]._ Unique name of the overlay to be displayed from among the following options. If you omit this argument, this function will default to the `"steamid"` overlay which displays profile information about that user.

* `"steamid"`
* `"chat"`
* `"jointrade"`
* `"stats"`
* `"achievements"`
* `"friendadd"`
* `"friendremove"`
* `"friendrequestaccept"`
* `"friendrequestignore"`


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Attempt to show a friend's achievements on screen
local friendSteamId = "FRIEND_ID"

local wasShown = steamworks.showUserOverlay( friendSteamId, "achievements" )

if not wasShown then
	print( "Failed to display the overlay." )
end
``````
