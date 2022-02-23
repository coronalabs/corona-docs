# userProgressUpdate

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, userProgressUpdate
> __See also__          [steamworks.addEventListener()][plugin.steamworks.addEventListener]
>                       [steamworks.requestUserProgress()][plugin.steamworks.requestUserProgress]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event occurs after Steam has attempted to fetch updated information about one user's achievements and stat data.

If successful, as indicated by the [event.isError][plugin.steamworks.event.userProgressUpdate.isError] property being `false`, the [steamworks.getAchievementInfo()][plugin.steamworks.getAchievementInfo] and [steamworks.getUserStatValue()][plugin.steamworks.getUserStatValue] functions will provide updated progression data for that user.

This event will be dispatched after a successful call to the [steamworks.requestUserProgress()][plugin.steamworks.requestUserProgress] function. It will also be dispatched for the currently logged in user:

* After application startup.
* After a successful call to the [steamworks.setAchievementUnlocked()][plugin.steamworks.setAchievementUnlocked] function.
* After a successful call to the [steamworks.setAchievementProgress()][plugin.steamworks.setAchievementProgress] function.
* After a successful call to the [steamworks.setUserStatValues()][plugin.steamworks.setUserStatValues] function.

You can receive these events by adding a [listener][api.type.Listener] to the plugin via the [steamworks.addEventListener()][plugin.steamworks.addEventListener] function.


## Properties

#### [event.isError][plugin.steamworks.event.userProgressUpdate.isError]

#### [event.name][plugin.steamworks.event.userProgressUpdate.name]

#### [event.resultCode][plugin.steamworks.event.userProgressUpdate.resultCode]

#### [event.userSteamId][plugin.steamworks.event.userProgressUpdate.userSteamId]


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Called when user achievement/stat data has been received
local function onUserProgressUpdated( event )
	if ( event.isError ) then
		-- Failed to receive updated progression data
	else
		-- User progression was successfully loaded
		-- You might want to reload achievement and stat data for user here
	end
end

-- Set up a listener to be invoked when achievement and stat data has been updated
steamworks.addEventListener( "userProgressUpdate", onUserProgressUpdated )
``````
