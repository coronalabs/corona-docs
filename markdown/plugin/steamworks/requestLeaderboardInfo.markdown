# steamworks.requestLeaderboardInfo()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, requestLeaderboardInfo
> __See also__          [steamworks.requestLeaderboardEntries()][plugin.steamworks.requestLeaderboardEntries]
>                       [steamworks.requestSetHighScore()][plugin.steamworks.requestSetHighScore]
>                       [leaderboardInfo][plugin.steamworks.event.leaderboardInfo]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Asynchronously fetches information about one leaderboard such as its entry count, display/value type, sort order, etc.

Returns `true` if the request was successfully sent to Steam. Note that this does not necessarily mean that the requested operation will succeed. For example, this function will return `true` if there is no Internet connection. So, the listener must check the received [event.isError][plugin.steamworks.event.leaderboardInfo.isError] property to determine if the requested operation succeeded.

Returns `false` if given invalid arguments or if the [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`.


## Syntax

	steamworks.requestLeaderboardInfo( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing parameters — see the next section for details.


## Parameter Reference

The `params` table can contain the following:

##### leaderboardName ~^(required)^~
_[String][api.type.String]._ The unique name of the leaderboard to fetch information from. On the Steamworks website, this is the leaderboard string set under the __Name__ column.

##### listener ~^(required)^~
_[Function][api.type.Function]._ Function which will receive the result of the request via a [leaderboardInfo][plugin.steamworks.event.leaderboardInfo] event.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

local function onReceivedLeaderboardInfo( event )
	if ( event.isError ) then
		-- The request has failed
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
-- Provides the requested result to the given "listener" function
local requestSettings =
{
	leaderboardName = "My Leaderboard Name",
	listener = onReceivedLeaderboardInfo
}
steamworks.requestLeaderboardInfo( requestSettings )
``````
