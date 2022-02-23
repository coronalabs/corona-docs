# steamworks.setUserStatValues()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, setUserStatValues
> __See also__          [steamworks.getUserStatValue()][plugin.steamworks.getUserStatValue]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets one or more numeric stat values for the current user. Note that stats are defined on the Steamworks website under the <nobr>__Stats & Achievements__</nobr> section. Stats are used to store developer defined user gameplay statistics such as games played, games won, games lost, etc.

Returns `true` if at least one stat value was updated for the current user.

Returns `false` if given invalid arguments, if none of the given stats were updated, or if the [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`.


## Syntax

	steamworks.setUserStatValues( arrayOfStatTables )

##### arrayOfStatTables ~^(required)^~
_[Array][api.type.Array]._ An array containing [tables][api.type.Table] of stat details — see the next section for details.


## Stat Reference

The `arrayOfStatTables` array can contain [tables][api.type.Table] where each table accepts the following parameters:

##### statName ~^(required)^~
_[String][api.type.String]._ On the Steamworks website, this is the unique name of the stat set under the __API&nbsp;Name__ column.

##### type ~^(required)^~
_[String][api.type.String]._ Indicates the type of value the stat is. Must be set to `"int"`, `"float"`, or `"averageRate"`. On the Steamworks website, this must match the value type set under the __Type__ column or else Steam will fail to assign the given value to that stat.

##### value ~^(required)^~
_[Number][api.type.Number]._ The numeric value to be assigned to the stat.

##### sessionTimeLength ~^(optional)^~
_[Number][api.type.Number]._ This parameter is only required if the stat's `type` parameter is set to `"averageRate"`. This is set to the amount of time for which the `value` parameter was measured, in units specified on the Steamworks website. For example, if the stat measures "Average&nbsp;Speed," then `value` would be set to the distance traveled during the game and the `sessionTimeLength` parameter would be set to how much time occurred during that game session. Steam would then automatically calculate the average speed for that session and all previous sessions.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Fetch the user's previous stats
local totalGamesPlayed = steamworks.getUserStatValue( { statName="Games Played", type="int" } )
local totalFeetTraveled = steamworks.getUserStatValue( { statName="Feet Traveled", type="float" } )

-- Increment total number of games played
if ( totalGamesPlayed == nil ) then
	totalGamesPlayed = 0
end
totalGamesPlayed = totalGamesPlayed + 1

-- Add number of feet traveled from this game session to the total
-- For this example, we set it to a random number
math.randomseed( os.time() )
local feetTraveled = ( math.random( 1, 100 ) / 10 )
if ( totalFeetTraveled == nil ) then
	totalFeetTraveled = 0
end
totalFeetTraveled = totalFeetTraveled + feetTraveled

-- Update the user's stats on Steam
local wasSuccessful = steamworks.setUserStatValues(
{
	{
		statName = "Games Played",
		type = "int",
		value = totalGamesPlayed
	},
	{
		statName = "Feet Traveled",
		type = "float",
		value = totalFeetTraveled
	},
	{
		statName = "Average Speed",
		type = "averageRate",
		value = feetTraveled,    -- Feet for this session; do not use "totalFeetTraveled"
		sessionTimeLength = 0.5  -- In hours (this is 30 minutes)
	},
})
``````
