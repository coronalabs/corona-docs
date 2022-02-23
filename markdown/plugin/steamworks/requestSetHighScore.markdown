# steamworks.requestSetHighScore()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, requestSetHighScore
> __See also__          [steamworks.requestLeaderboardInfo()][plugin.steamworks.requestLeaderboardInfo]
>                       [steamworks.requestLeaderboardEntries()][plugin.steamworks.requestLeaderboardEntries]
>                       [setHighScore][plugin.steamworks.event.setHighScore]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Asynchronously sends a given score value to the specified leaderboard. The given score will only be accepted by the leaderboard if it is higher than the user's previous score.

Returns `true` if the request was successfully sent to Steam. Note that this does not necessarily mean that the requested operation will succeed. For example, this function will return `true` if there is no Internet connection. So, the listener must check the received [event.isError][plugin.steamworks.event.setHighScore.isError] property to determine if the requested operation succeeded. 

Returns `false` if given invalid arguments or if the [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`.


## Gotchas

Internet access is required to set a high score on a leaderboard. Unlike achievements and stats, Steam will not cache high score updates while offline and resync the changes with the Steam server once Internet access becomes available again.


## Syntax

	steamworks.requestSetHighScore( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing parameters — see the next section for details.


## Parameter Reference

The `params` table can contain the following:

##### leaderboardName ~^(required)^~
_[String][api.type.String]._ The unique name of the leaderboard to send the high score to. On the Steamworks website, this is the leaderboard string set under the __Name__ column.

##### listener ~^(required)^~
_[Function][api.type.Function]._ Function which will receive the result of the request via a [setHighScore][plugin.steamworks.event.setHighScore] event.

##### value ~^(required)^~
_[Number][api.type.Number]._ Integer value to be uploaded to the leaderboard as the new high score.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

local function onReceivedSetHighScoreResult( event )
	if ( event.isError ) then
		-- The request has failed
		-- Note that an error will not occur if the given score is less than the highest
		print( "Failed to access the leaderboard." )
	else
		-- Print the result of this request to the log
		print( "Leaderboard Name: " .. event.leaderboardName )
		print( "Was Score Changed: " .. tostring(event.scoreChanged) )
		if ( event.scoreChanged ) then
			print( "Current Rank: " .. tostring(event.currentGlobalRank) )
			print( "Previous Rank: " .. tostring(event.previousGlobalRank) )
		end
	end
end

-- Attempt to set a new high score for the current user
-- Requires an active Internet connection to succeed
-- Provides the requested result to the given "listener" function
local requestSettings =
{
	leaderboardName = "My Leaderboard Name",
	value = 9000,
	listener = onReceivedSetHighScoreResult,
}
steamworks.requestSetHighScore( requestSettings )
``````
