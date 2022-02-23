# steamworks.getUserStatValue()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, getUserStatValue
> __See also__          [steamworks.setUserStatValues()][plugin.steamworks.setUserStatValues]
>                       [steamworks.requestUserProgress()][plugin.steamworks.requestUserProgress]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Fetches one numeric stat value from a user. Note that stats are defined on the Steamworks website under the <nobr>__Stats & Achievements__</nobr> section. Stats are used to store <nobr>developer-defined</nobr> user gameplay statistics such as games played, games won, games lost, etc.

When fetching a stat from another user, you must first call the [steamworks.requestUserProgress()][plugin.steamworks.requestUserProgress] function with that user's&nbsp;ID and wait for a successful [userProgressUpdate][plugin.steamworks.event.userProgressUpdate] event.


## Gotchas

This function will return `nil` in the following cases:

* The given `statName` is invalid.
* A stat value hasn't yet been set for the user (typical&nbsp;of new&nbsp;players).
* You attempted to fetch a stat from another user without first calling the [steamworks.requestUserProgress()][plugin.steamworks.requestUserProgress] function.
* The [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`, indicating that the application is not currently connected to the Steam client.


## Syntax

	steamworks.getUserStatValue( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing stat parameters — see the next section for details.


## Parameter Reference

The `params` table can contain the following:

##### statName ~^(required)^~
_[String][api.type.String]._ On the Steamworks website, this is the unique name of the stat set under the __API&nbsp;Name__ column.

##### type ~^(required)^~
_[String][api.type.String]._ Indicates the type of stat value to fetch. Must be set to `"int"`, `"float"`, or `"averageRate"`. On the Steamworks website, this must match the value type set under the __Type__ column or else Steam will fail to fetch the stat value.

##### userSteamId ~^(optional)^~
_[String][api.type.String]._ Unique string ID of the user. The ID will default to the current user if this argument is not provided.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Called when user achievement/stat data has been received
local function onUserProgressUpdated( event )
	-- Do not continue if fetching user progression data failed
	if ( event.isError ) then
		return
	end

	-- We're only interested in the currently logged in user's stats (ignore info from other users)
	if ( event.userSteamId ~= steamworks.userSteamId ) then
		return
	end

	-- Fetch a stat from the currently logged in user
	local params =
	{
		statName = "Games Played",
		type = "int",
	}
	local statValue = steamworks.getUserStatValue( params )

	-- If the value is "nil", this stat has not yet been set for this user
	-- This is typically the case for new players
	if ( statValue == nil ) then
		statValue = 0
	end

	-- Print the stat value to the log
	print( "Games Played: " .. tostring(statValue) )
end

-- Set up a listener to be invoked when achievement and stat data has been updated
steamworks.addEventListener( "userProgressUpdate", onUserProgressUpdated )
``````
