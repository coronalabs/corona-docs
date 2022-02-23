# steamworks.showGameOverlay()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, overlay, showGameOverlay
> __See also__          [steamworks.canShowOverlay][plugin.steamworks.canShowOverlay]
>                       [steamworks.showStoreOverlay()][plugin.steamworks.showStoreOverlay]
>                       [steamworks.showUserOverlay()][plugin.steamworks.showUserOverlay]
>                       [steamworks.showWebOverlay()][plugin.steamworks.showWebOverlay]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays a Steam overlay on top of the application window. This overlay shows information related to the game currently being played such as its main community page, user stats, achievements, etc. This is the same overlay that <nobr>Shift+Tab</nobr> would normally display.

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

	steamworks.showGameOverlay( [overlayName] )

##### overlayName ~^(optional)^~
_[String][api.type.String]._ Unique name of the overlay to be displayed from among the following options. If you omit this argument or if the given name is unknown, Steam defaults to displaying what was last shown in the game overlay. If an overlay was not displayed before, Steam defaults to displaying the game's main overlay which is normally shown when pressing <nobr>Shift+Tab</nobr>.

* `"Achievements"`
* `"Community"`
* `"Friends"`
* `"OfficialGameGroup"`
* `"Players"`
* `"Settings"`
* `"Stats"`


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Attempt to show the user's current achievements
local wasShown = steamworks.showGameOverlay( "Achievements" )

if not wasShown then
	print( "Failed to display the overlay." )
end
``````
