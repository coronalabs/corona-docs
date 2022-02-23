# steamworks.addEventListener()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, event, addEventListener
> __See also__          [steamworks.removeEventListener()][plugin.steamworks.removeEventListener]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Adds a listener to the plugin's collection of event listeners. When the named event occurs, the listener will be invoked and be supplied with a table representing that event.

Returns `true` if the listener was successfully added to the plugin. Returns `false` if given invalid arguments, such as the listener not being a function or if it's a table that is missing a function matching the event name.


## Syntax

	steamworks.addEventListener( eventName, listener )

##### eventName ~^(required)^~
_[String][api.type.String]._ The name of the event to listen for. Must be one of the following:

* `"achievementImageUpdate"` ([reference][plugin.steamworks.event.achievementImageUpdate])
* `"achievementInfoUpdate"` ([reference][plugin.steamworks.event.achievementInfoUpdate])
* `"microtransactionAuthorization"` ([reference][plugin.steamworks.event.microtransactionAuthorization])
* `"overlayStatus"` ([reference][plugin.steamworks.event.overlayStatus])
* `"userInfoUpdate"` ([reference][plugin.steamworks.event.userInfoUpdate])
* `"userProgressSave"` ([reference][plugin.steamworks.event.userProgressSave])
* `"userProgressUnload"` ([reference][plugin.steamworks.event.userProgressUnload])
* `"userProgressUpdate"` ([reference][plugin.steamworks.event.userProgressUpdate])

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener to be invoked when the plugin dispatches an event whose `name` property matches the given `eventName` argument. This argument must be a function or a table object containing a function having the same name as the event.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Set up a listener to be called when Steam's overlay has been shown/hidden
local function onSteamOverlayStatusChanged( event )
	print( "Steam overlay phase: " .. event.phase )
end
steamworks.addEventListener( "overlayStatus",  onSteamOverlayStatusChanged )

-- Set up a listener to be called when a Steam user's info has been changed
local function onSteamUserInfoUpdated( event )
	print( "Steam user info has changed." )
end
steamworks.addEventListener( "userInfoUpdate", onSteamUserInfoUpdated )
``````
