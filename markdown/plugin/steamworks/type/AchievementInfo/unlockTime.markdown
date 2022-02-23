# object.unlockTime

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, achievements, AchievementInfo, unlockTime
> __See also__          [AchievementInfo][plugin.steamworks.type.AchievementInfo]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Number indicating a local Unix time value (seconds&nbsp;since&nbsp;1970) of when the achievement was unlocked.

This will be `nil` if the achievement has not yet been unlocked.

If unlocked, this time value can be converted to a <nobr>human-readable</nobr> date and time string by passing it to the [os.date()][api.library.os.date] function. This time value can also be compared with the current time value returned by the [os.time()][api.library.os.time] function.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

local achievementInfo = steamworks.getAchievementInfo( "achievementName" )

if ( achievementInfo and achievementInfo.unlocked ) then
	-- Print when the achievement was unlocked
	print( "Achievement unlocked on " .. os.date( "%c", achievementInfo.unlockTime ) )

	-- Print how many days ago the achievement was unlocked
	local secondsPerDay = 86400
	local daysAgo = ( os.time() - achievementInfo.unlockTime ) / secondsPerDay
	print( "Achievement unlocked " .. string.format( "%0.1f", daysAgo ) .. " days ago" )
end
``````
