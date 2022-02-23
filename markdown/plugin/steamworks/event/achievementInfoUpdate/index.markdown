# achievementInfoUpdate

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, achievements, achievementInfoUpdate
> __See also__          [steamworks.addEventListener()][plugin.steamworks.addEventListener]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event occurs when an achievement's progress or unlock status has been changed for the currently logged in user. It is dispatched after a successful call to the [steamworks.setAchievementUnlocked()][plugin.steamworks.setAchievementUnlocked] or [steamworks.setAchievementProgress()][plugin.steamworks.setAchievementProgress] functions.

You can receive these events by adding a [listener][api.type.Listener] to the plugin via the [steamworks.addEventListener()][plugin.steamworks.addEventListener] function.


## Properties

#### [event.achievementName][plugin.steamworks.event.achievementInfoUpdate.achievementName]

#### [event.currentProgress][plugin.steamworks.event.achievementInfoUpdate.currentProgress]

#### [event.maxProgress][plugin.steamworks.event.achievementInfoUpdate.maxProgress]

#### [event.name][plugin.steamworks.event.achievementInfoUpdate.name]


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Called when an achievement's progress or unlock status has changed
local function onAchievementInfoUpdated( event )
	-- Fetch information about the achievement that has changed status
	local achievementInfo = steamworks.getAchievementInfo( event.achievementName )

	-- Print the achievement's current progress to the log
	print( "Achievement Progress Updated" )
	print( "  Localized Name: " .. achievementInfo.localizedName )
	print( "  Localized Description: " .. achievementInfo.localizedDescription )
	print( "  Is Unlocked: " .. tostring(achievementInfo.unlocked) )

	-- Print progress to the log
	-- This is only relevant if "steamworks.setAchievementProgress()" was called
	if ( event.currentProgress ) then
		local percentProgress = ( event.currentProgress / event.maxProgress ) * 100
		print( "  Progress: " .. tostring(percentProgress) .. "%" )
	end
end

-- Set up a listener to be invoked when achievement status has changed
steamworks.addEventListener( "achievementInfoUpdate", onAchievementInfoUpdated )
``````
