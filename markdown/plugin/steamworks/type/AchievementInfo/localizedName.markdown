# object.localizedName

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, achievements, AchievementInfo, localizedName
> __See also__          [AchievementInfo][plugin.steamworks.type.AchievementInfo]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A [string][api.type.String] providing a localized <nobr>human-readable</nobr> name of the achievement. This is configured by the app developer on the Steamworks website. If a localized name for the client system's current locale is not defined on the Steamworks website, the achievement's __API&nbsp;Name__ column string will be returned.

## Example

``````lua
local steamworks = require( "plugin.steamworks" )

local achievementInfo = steamworks.getAchievementInfo( "achievementName" )

if ( achievementInfo ) then
	print( "Achievement Name: " .. achievementInfo.localizedName )
end
``````
