# userProgressSave

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, userProgressSave
> __See also__          [steamworks.addEventListener()][plugin.steamworks.addEventListener]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event occurs when Steam has attempted to save and upload the currently logged in user's progression data such as unlocked achievements and updated stats. The [event.isError][plugin.steamworks.event.userProgressSave.isError] property indicates if progression was successfully saved to Steam or not. These events are typically triggered after calling the [steamworks.setAchievementUnlocked()][plugin.steamworks.setAchievementUnlocked] and [steamworks.setUserStatValues()][plugin.steamworks.setUserStatValues] functions.

You can receive these events by adding a [listener][api.type.Listener] to the plugin via the [steamworks.addEventListener()][plugin.steamworks.addEventListener] function.


## Properties

#### [event.isError][plugin.steamworks.event.userProgressSave.isError]

#### [event.name][plugin.steamworks.event.userProgressSave.name]

#### [event.resultCode][plugin.steamworks.event.userProgressSave.resultCode]

#### [event.userSteamId][plugin.steamworks.event.userProgressSave.userSteamId]


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Called when Steam has attempted to save/upload user progression
local function onUserProgressSaved( event )
	if ( event.isError ) then
		-- Failed to save/upload user's unlocked achievements and stat data
		if ( event.resultCode == 3 ) then
			-- Failed due to an invalid parameter
			-- For example, calling "steamworks.setUserStats()" with values that break constraints
		else
			-- Failed due to some other reason
		end
	else
		-- User progression was successfully saved and uploaded to Steam's server
	end
end

-- Set up a listener to be invoked when Steam has attempted to save user progress
steamworks.addEventListener( "userProgressSave", onUserProgressSaved )
``````
