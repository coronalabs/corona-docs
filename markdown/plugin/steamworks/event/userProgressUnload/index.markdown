# userProgressUnload

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, userProgressUnload
> __See also__          [steamworks.addEventListener()][plugin.steamworks.addEventListener]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event occurs when Steam has unloaded achievement and stat data of another user <nobr>(not the logged in user)</nobr> from memory. This means that this user's game progression data will no longer be available via the [steamworks.getAchievementInfo()][plugin.steamworks.getAchievementInfo] and [steamworks.getUserStatValue()][plugin.steamworks.getUserStatValue] functions&nbsp;&mdash; you'll have to call the [steamworks.requestUserProgress()][plugin.steamworks.requestUserProgress] function to reload the user's progression data back into memory.

You can receive these events by adding a [listener][api.type.Listener] to the plugin via the [steamworks.addEventListener()][plugin.steamworks.addEventListener] function.


## Gotchas

* Steam will unload progression data of other users automatically. You cannot control this.

* Steam will never unload the progression data of the currently logged in user.


## Properties

#### [event.name][plugin.steamworks.event.userProgressUnload.name]

#### [event.userSteamId][plugin.steamworks.event.userProgressUnload.userSteamId]


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Called when Steam has unloaded achievement/stat info of another user from memory
local function onUserProgressUnloaded( event )
	print( "Unloaded progression data from user ID: " .. event.userSteamId )
end

-- Set up a listener to be invoked when Steam unloads achievement/stat info of another user
steamworks.addEventListener( "userProgressUnload", onUserProgressUnloaded )
``````
