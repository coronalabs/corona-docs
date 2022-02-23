# leaderboardEntries

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, leaderboardEntries
> __See also__          [steamworks.requestLeaderboardEntries()][plugin.steamworks.requestLeaderboardEntries]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Event providing an array of entries requested from a leaderboard.

This event can only be received by a [function][api.type.Function] listener that has been passed to the [steamworks.requestLeaderboardEntries()][plugin.steamworks.requestLeaderboardEntries] function.


## Properties

#### [event.entries][plugin.steamworks.event.leaderboardEntries.entries]

#### [event.isError][plugin.steamworks.event.leaderboardEntries.isError]

#### [event.leaderboardHandle][plugin.steamworks.event.leaderboardEntries.leaderboardHandle]

#### [event.leaderboardName][plugin.steamworks.event.leaderboardEntries.leaderboardName]

#### [event.name][plugin.steamworks.event.leaderboardEntries.name]


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Called by the "steamworks.requestLeaderboardEntries()" function with the result
local function onReceivedLeaderboardEntries( event )
	if ( event.isError ) then
		-- Request failed; typically happens when there is no Internet access
		print( "Failed to fetch leaderboard entries." )
	else
		-- Print the received leaderboard entries to the log
		for index = 1, #event.entries do
			-- Get the next leaderboard entry
			local nextEntry = event.entries[index]

			-- Fetch the user's nickname via their steam ID
			local userName = "Unknown"
			local userInfo = steamworks.getUserInfo( nextEntry.userSteamId )
			if ( userInfo ) then
				userName = userInfo.nickname
			end

			-- Print the leaderboard entry to the log
			local message = string.format(
				"Rank(%d) Name(%s) Score(%d)",
				nextEntry.globalRank, userName, nextEntry.score )
			print( message )
		end
	end
end

-- Fetch the top 10 players on the leaderboard
-- Requires an active Internet connection to succeed
-- Will provide the requested result to the given listener function
local requestSettings =
{
	leaderboardName = "My Leaderboard Name",
	playerScope = "Global",
	startIndex = 1,
	endIndex = 10,
	listener = onReceivedLeaderboardEntries
}
steamworks.requestLeaderboardEntries( requestSettings )
``````
