# steamworks.requestLeaderboardEntries()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, requestLeaderboardEntries
> __See also__          [steamworks.requestLeaderboardInfo()][plugin.steamworks.requestLeaderboardInfo]
>                       [steamworks.requestSetHighScore()][plugin.steamworks.requestSetHighScore]
>                       [leaderboardEntries][plugin.steamworks.event.leaderboardEntries]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Asynchronously fetches entries from one leaderboard.

Returns `true` if the request was successfully sent to Steam. Note that this does not necessarily mean that the requested operation will succeed. For example, this function will return `true` if there is no Internet connection. So, the listener must check the received [event.isError][plugin.steamworks.event.leaderboardEntries.isError] property to determine if the requested operation succeeded.

Returns `false` if given invalid arguments or if the [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`.


## Syntax

	steamworks.requestLeaderboardEntries( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing leaderboard parameters — see the next section for details.


## Parameter Reference

The `params` table can contain the following:

##### leaderboardName ~^(required)^~
_[String][api.type.String]._ The unique name of the leaderboard to fetch entries from. On the Steamworks website, this is the leaderboard string set under the __Name__ column.

##### listener ~^(required)^~
_[Function][api.type.Function]._ Function which will receive the result of the request via a [leaderboardEntries][plugin.steamworks.event.leaderboardEntries] event.

##### startIndex ~^(optional)^~
_[Number][api.type.Number]._ Optional integer value specifying the first entry to fetch from the leaderboard. If this parameter is set, you must also set an `endIndex` parameter or else this function will fail and return `false`. See the `playerScope` details below on how to set this index.

##### endIndex ~^(optional)^~
_[Number][api.type.Number]._ Optional integer value specifying the last entry to fetch from the leaderboard. If this parameter is set, then you must also set a `startIndex` parameter or else this function will fail and return `false`. See the `playerScope` details below on how to set this index.

##### playerScope ~^(required)^~
_[String][api.type.String]._ Optional parameter providing a way to filter the entries based on friends or nearby players:

<div class="inner-table">

Scope					Description
----------------------	------------------------------------------------------------
`"Global"`				The default scope if not specified otherwise. The `startIndex` and `endIndex` parameters are absolute <nobr>1-based</nobr> indexes where index `1` references the top person on the leaderboard, for example the player with the highest score at rank&nbsp;1. If you do not set the `startIndex` and `endIndex` parameters, this function will default to fetching the top 25 scores from the leaderboard.
`"GlobalAroundUser"`	The `startIndex` and `endIndex` parameters are relative indexes, where index `0` references the currently logged in user's entry on the leaderboard. Negative indexes reference entries having a higher rank/score than the user, while positive indexes reference entries having a lower rank/score than the user. If you do not set the `startIndex` and `endIndex` parameters, this function will default to `-12` and `12` respectively which fetches 12 entries with a higher rank than the currently logged in user and 12 entries with a lower rank, for a total of 25 entries when factoring in the user's index of `0`.
`"FriendsOnly"`			The leaderboard entries for all of the currently logged in user's friends will be fetched. The `startIndex` and `endIndex` parameters are ignored.
---------------------  ------------------------------------------------------------

</div>


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

local function onReceivedLeaderboradEntries( event )
	-- Do not continue if fetching of leaderboard entries failed
	if ( event.isError ) then
		print( "Failed to fetch leaderboard entries." )
		return
	end

	-- Print information about each leaderborad entry to the log
	for index = 1, #event.entries do
		-- Concatenate the player's rank
		local message = "Rank: " .. tostring(event.entries[index].globalRank)

		-- Concatenate the player's name
		message = message .. ", User: "
		local userInfo = steamworks.getUserInfo( event.entries[index].userSteamId )
		if ( userInfo ) then
			message = message .. userInfo.name
			if ( string.len( userInfo.nickname ) > 0 ) then
				message = message .. " (" .. userInfo.nickname .. ")"
			end
		else
			message = message .. event.entries[index].userSteamId
		end

		-- Concatenate the player's score
		message = message .. ", Score: " .. tostring(event.entries[index].score)

		-- Output the above concatenated message to the log
		print( message )
	end
end

-- Fetch leaderboard entries around the currently logged in user's entry
local requestParams =
{
	leaderboardName = "My Leaderboard",
	listener = onReceivedLeaderboradEntries,
	playerScope = "GlobalAroundUser",
	startIndex = -4,  -- Get 4 entries with higher score than user
	endIndex = 5      -- Get 5 entries with lower score than user
}
steamworks.requestLeaderboardEntries( requestParams )
``````
