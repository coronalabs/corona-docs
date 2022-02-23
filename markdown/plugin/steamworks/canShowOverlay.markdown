# steamworks.canShowOverlay

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, canShowOverlay
> __See also__			[steamworks.showGameOverlay()][plugin.steamworks.showGameOverlay]
>						[steamworks.showStoreOverlay()][plugin.steamworks.showStoreOverlay]
>						[steamworks.showUserOverlay()][plugin.steamworks.showUserOverlay]
>						[steamworks.showWebOverlay()][plugin.steamworks.showWebOverlay]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This will be `true` if Steam overlays can be shown on top of the app. This means that Steam popup notifications can be shown and screen overlays can be shown via this plugin's APIs or by the user pressing the default <nobr>Shift+Tab</nobr> keys.


## Gotchas

This property will be `false` in the following cases:

* A valid `appId` was not set in `config.lua` as documented [here][REFLINK 1].
* The [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`, indicating that the application is not currently connected to the Steam client.
* The Steam client is not currently running.
* User has disabled overlays in the Steam client's <nobr>__In-Game__</nobr> settings screen.
* During the first few seconds of app startup. This is normal behavior since the Steam client needs time to bind to the application process.
* On Mac, the application (such as the Corona&nbsp;Simulator) was not launched from the Steam client, or a required system preference setting is missing. See the [Overlay Troubleshooting][plugin.steamworks.guide.overlays] guide for more details.

<!--- REFERENCE LINK -->

[REFLINK 1]: ../../plugin/steamworks/index.html#project-settings


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

print( "Can Show Steam Overlay: " .. tostring(steamworks.canShowOverlay) )
``````
