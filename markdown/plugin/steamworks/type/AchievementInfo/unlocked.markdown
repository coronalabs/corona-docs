# object.unlocked

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, achievements, AchievementInfo, unlocked
> __See also__          [AchievementInfo][plugin.steamworks.type.AchievementInfo]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[Boolean][api.type.Boolean] value indicating if the achievement has been unlocked by the user.

An application can unlock an achievement by calling the [steamworks.setAchievementUnlocked()][plugin.steamworks.setAchievementUnlocked] function or by calling the  [steamworks.setAchievementProgress()][plugin.steamworks.setAchievementProgress] function set to its max progress value.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

local achievementInfo = steamworks.getAchievementInfo( "achievementName" )

if ( achievementInfo ) then
	if ( achievementInfo.unlocked ) then
		-- Achievement unlocked
	else
		-- Achievement has not been unlocked yet
	end
end
``````
