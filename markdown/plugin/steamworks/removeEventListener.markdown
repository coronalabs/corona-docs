# steamworks.removeEventListener()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, event, removeEventListener
> __See also__          [steamworks.addEventListener()][plugin.steamworks.addEventListener]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Removes a listener that was once added to the plugin via the [steamworks.addEventListener()][plugin.steamworks.addEventListener] function. This prevents that listener from being invoked for its corresponding event.

Returns `true` if the listener was successfully removed from the plugin. Returns `false` if given invalid arguments or if the given listener reference has not been added to the plugin.


## Syntax

	steamworks.removeEventListener( eventName, listener )

##### eventName ~^(required)^~
_[String][api.type.String]._ The name of the event to stop listening to. Must be one of the following:

* `"achievementImageUpdate"` ([reference][plugin.steamworks.event.achievementImageUpdate])
* `"achievementInfoUpdate"` ([reference][plugin.steamworks.event.achievementInfoUpdate])
* `"microtransactionAuthorization"` ([reference][plugin.steamworks.event.microtransactionAuthorization])
* `"overlayStatus"` ([reference][plugin.steamworks.event.overlayStatus])
* `"userInfoUpdate"` ([reference][plugin.steamworks.event.userInfoUpdate])
* `"userProgressSave"` ([reference][plugin.steamworks.event.userProgressSave])
* `"userProgressUnload"` ([reference][plugin.steamworks.event.userProgressUnload])
* `"userProgressUpdate"` ([reference][plugin.steamworks.event.userProgressUpdate])

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Reference to the same listener that was originally added to the [steamworks.addEventListener()][plugin.steamworks.addEventListener] function.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Set up a listener to be called when Steam's overlay has been shown/hidden
local function onSteamOverlayStatusChanged( event )
	print( "Steam Overlay Phase: " .. event.phase )
end
steamworks.addEventListener( "overlayStatus", onSteamOverlayStatusChanged )

-- Sometime later, stop listening to the Steam overlay that was set
steamworks.removeEventListener( "overlayStatus", onSteamOverlayStatusChanged )
``````
