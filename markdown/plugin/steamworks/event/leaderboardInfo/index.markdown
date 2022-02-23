# leaderboardInfo

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, leaderboardInfo
> __See also__          [steamworks.requestLeaderboardInfo()][plugin.steamworks.requestLeaderboardInfo]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Event providing information about one leaderboard such as its entry count, display/value type, sort order, etc.

This event can only be received by a [function][api.type.Function] listener that has been passed to the [steamworks.requestLeaderboardInfo()][plugin.steamworks.requestLeaderboardInfo] function.


## Properties

#### [event.displayType][plugin.steamworks.event.leaderboardInfo.displayType]

#### [event.entryCount][plugin.steamworks.event.leaderboardInfo.entryCount]

#### [event.isError][plugin.steamworks.event.leaderboardInfo.isError]

#### [event.leaderboardHandle][plugin.steamworks.event.leaderboardInfo.leaderboardHandle]

#### [event.leaderboardName][plugin.steamworks.event.leaderboardInfo.leaderboardName]

#### [event.name][plugin.steamworks.event.leaderboardInfo.name]

#### [event.sortMethod][plugin.steamworks.event.leaderboardInfo.sortMethod]


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Called by the "steamworks.requestLeaderboardInfo()" function with the result
local function onReceivedLeaderboardInfo( event )
	if ( event.isError ) then
		-- Request failed; typically happens when there is no Internet access
		print( "Failed to fetch leaderboard info." )
	else
		-- Print the received leaderboard information to the log
		print( "Leaderboard Name: " .. event.leaderboardName )
		print( "Entry Count: " .. tostring(event.entryCount) )
		print( "Sort Method: " .. event.sortMethod )
		print( "Display Type: " .. event.displayType )
	end
end

-- Fetch information about one leaderboard
-- Requires an active Internet connection to succeed
-- Will provide the requested result to the given listener function
local requestSettings =
{
	leaderboardName = "My Leaderboard Name",
	listener = onReceivedLeaderboardInfo,
}
steamworks.requestLeaderboardInfo( requestSettings )
``````
