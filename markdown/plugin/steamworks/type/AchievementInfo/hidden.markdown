# object.hidden

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, achievements, AchievementInfo, hidden
> __See also__          [AchievementInfo][plugin.steamworks.type.AchievementInfo]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[Boolean][api.type.Boolean] value indicating if the achievement is set up to be hidden while locked.

Typically, you would not display information about locked hidden achievements, especially if their names and descriptions might spoil the end of a game.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

local achievementInfo = steamworks.getAchievementInfo( "achievementName" )

if ( achievementInfo ) then
	if ( achievementInfo.hidden and ( achievementInfo.unlocked == false ) ) then
		-- This is a hidden achievement that hasn't been unlocked yet
		-- We should not display information about it
	end
end
``````
