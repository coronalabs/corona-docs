# setHighScore

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, setHighScore
> __See also__          [steamworks.requestSetHighScore()][plugin.steamworks.requestSetHighScore]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Event indicating if a call to the [steamworks.requestSetHighScore()][plugin.steamworks.requestSetHighScore] function succeeded or failed. Also indicates if the score has changed and, if&nbsp;so, what the user's new global rank on the leaderboard is.

This event can only be received by a [function][api.type.Function] listener that has been passed to the [steamworks.requestSetHighScore()][plugin.steamworks.requestSetHighScore] function.


## Properties

#### [event.currentGlobalRank][plugin.steamworks.event.setHighScore.currentGlobalRank]

#### [event.isError][plugin.steamworks.event.setHighScore.isError]

#### [event.leaderboardHandle][plugin.steamworks.event.setHighScore.leaderboardHandle]

#### [event.leaderboardName][plugin.steamworks.event.setHighScore.leaderboardName]

#### [event.name][plugin.steamworks.event.setHighScore.name]

#### [event.previousGlobalRank][plugin.steamworks.event.setHighScore.previousGlobalRank]

#### [event.scoreChanged][plugin.steamworks.event.setHighScore.scoreChanged]


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Called by the "steamworks.requestSetHighScore()" function with the result
local function onReceivedSetHighScoreResult( event )
	if ( event.isError ) then
		-- Request failed; typically happens when there is no Internet access
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
-- Will provide the requested result to the given function
local requestSettings =
{
	leaderboardName = "My Leaderboard Name",
	value = 9000,
	listener = onReceivedSetHighScoreResult
}
steamworks.requestSetHighScore( requestSettings )
``````
