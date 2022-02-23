# steamworks.getAchievementInfo()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [AchievementInfo][plugin.steamworks.type.AchievementInfo]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, achievements, getAchievementInfo
> __See also__          [steamworks.requestUserProgress()][plugin.steamworks.requestUserProgress]
>                       [steamworks.setAchievementUnlocked()][plugin.steamworks.setAchievementUnlocked]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns an [AchievementInfo][plugin.steamworks.type.AchievementInfo] object. This provides information about one achievement such as its localized name, description, unlock status, etc. for the currently logged in user (or&nbsp;another&nbsp;user).

When fetching another user's achievement information, you must first call the [steamworks.requestUserProgress()][plugin.steamworks.requestUserProgress] function with that user's&nbsp;ID and wait for a successful [userProgressUpdate][plugin.steamworks.event.userProgressUpdate] event.


## Gotchas

This function will return `nil` in the following cases:

* Invalid arguments were specified.
* The [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`, indicating the application is not currently connected to the Steam client.
* The system does not have Internet access and information is not currently cached for that user.
* You attempted to fetch another user's information without first calling [steamworks.requestUserProgress()][plugin.steamworks.requestUserProgress].


## Syntax

	steamworks.getAchievementInfo( achievementName [, userSteamId] )

##### achievementName ~^(required)^~
_[String][api.type.String]._ On the Steamworks website, this is the unique name of the achievement set under the <nobr>__API Name Progress Stat__</nobr> column.

##### userSteamId ~^(optional)^~
_[String][api.type.String]._ The unique string ID of the user. The ID will default to the current user if this argument is not provided.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Called when achievement status or stat data has been updated/changed
-- This will be called for the currently logged in user, and other users too
local function onUserProgressUpdated( event )
	-- Determine who this progress update is for
	if ( event.userSteamId == steamworks.userSteamId ) then
		print( "Received progress info for current user." )
	else
		print( "Received progress info for another user." )
	end

	-- Print the user's current achievement info
	local achievementInfo = steamworks.getAchievementInfo( "MyAchievementName", event.userSteamId )
	if ( achievementInfo ) then
		print( "  Localized Name: " .. achievementInfo.localizedName )
		print( "  Localized Description: " .. achievementInfo.localizedDescription )
		print( "  Is Hidden: " .. tostring(achievementInfo.hidden) )
		print( "  Was Unlocked: " .. tostring(achievementInfo.unlocked) )
		if ( achievementInfo.unlocked ) then
			-- Note that "unlockTime" is in local Unix time
			-- This can be compared with "os.time()" and used by "os.date()"
			print( "  Unlock Time: " .. os.date( "%c", achievementInfo.unlockTime ) )
		end
	end
end

-- Listen for achievement status or stat data changes from all users
steamworks.addEventListener( "userProgressUpdate", onUserProgressUpdated )
``````
