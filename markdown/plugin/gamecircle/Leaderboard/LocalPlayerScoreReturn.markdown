# gamecircle.Leaderboard.LocalPlayerScoreReturn

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          achievement, return, value, table  
> --------------------- ------------------------------------------------------------------------------------------

## Overview
Table that encapulates the error values and return value from the [GetLocalPlayerScore][plugin.gamecircle.Leaderboard.GetLocalPlayerScore] function.
	
## Properties
- __isError__ - _[Boolean][api.type.Boolean]_  
	If the GameCircle SDK encountered an error, this value will be true.
- __errorMessage__ - _[String][api.type.String]_  
	If the GameCircle SDK encountered an error, this string will be populated with an error message.
- __rank__ - _[Number][api.type.Number]_  
	The local player's rank on the leaderboard, base on the filter given in the originating request function.
- __score__ - _[Number][api.type.Number]_  
	The highest score recorded for the local player on a leaderboard given the filter provided in the originating request function. 

## Example
 
``````lua  
local leaderboardId = "myFirstLeaderboard"  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, true, false)  
function LeaderboardCallback(returnValue)  
	if returnValue.isError == true then  
		print("Get Scores request returned with error message: " .. returnValue.errorMessage)  
	else  
		print("Score information recieved for Leaderboard!")  
		print("The local player is rank " .. returnValue.rank .. " with a score of " .. returnValue.score .. ".")  
	end  
end  
gamecircle.Leaderboard.GetLocalPlayerScore(leaderboardId, "GLOBAL_WEEK", LeaderboardCallback)  
``````
