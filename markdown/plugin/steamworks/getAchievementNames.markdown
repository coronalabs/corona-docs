# steamworks.getAchievementNames()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Array][api.type.Array]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, achievements, getAchievementNames
> __See also__          [steamworks.getAchievementInfo()][plugin.steamworks.getAchievementInfo]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Fetches the unique names of all achievements configured for the application and returns it as an [array][api.type.Array] of [strings][api.type.String]. On the Steamworks website, these are the unique achievement names listed under the <nobr>__API Name Progress Stat__</nobr> column.


## Gotchas

This function will return an empty array in the following cases:

* No achievements are configured for the application.
* The [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`, indicating that the application is not currently connected to the Steam client.


## Syntax

	steamworks.getAchievementNames()


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Print information about all achievements belonging to this application
local achievementNames = steamworks.getAchievementNames()
for index = 1, #achievementNames do
	-- Fetch information about the next achievement
	local achievementName = achievementNames[index]
	local achievementInfo = steamworks.getAchievementInfo( achievementName )

	-- Print the achievement's information/status to the log
	print( "Achievement " .. tostring(index) )
	print( "  Localized Name: " .. achievementInfo.localizedName )
	print( "  Localized Description: " .. achievementInfo.localizedDescription )
	print( "  Is Unlocked: " .. tostring(achievementInfo.unlocked) )
end
``````
