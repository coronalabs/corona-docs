# gamecircle.Leaderboard.GetScoresReturn

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          leaderboards, return, value, table, scores
> --------------------- ------------------------------------------------------------------------------------------

## Overview
	Table that encapulates the error values and return values from the [GetScores][plugin.gamecircle.Leaderboard.GetScores] function.
	
## Properties
- __isError__ - _[Boolean][api.type.Boolean]_  
	If the GameCircle SDK encountered an error, this value will be true.
- __errorMessage__ - _[String][api.type.String]_  
	If the GameCircle SDK encountered an error, this string will be populated with an error message.
- __leaderboard__ - _[Leaderboard][plugin.gamecircle.Leaderboard.Leaderboard]_ 
	The Leaderboard from the GetScores request.
- __num__ - [Number][api.type.Number]_  
	The number of leaderboards scores with the request. 
- __[]__ ___Square Bracket Accessor___ - _[Score][plugin.gamecircle.Leaderboard.Score]_  
	The returned scores are stored as numerically-indexed entires on the table, ranging in value from 1 to "num". They can also be access using an ipairs interation, as in the example below.


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
		print("-Leaderboard ID" .. returnValue.id)  
		print("-name" .. returnValue.name)  
		print("-displayText" .. returnValue.displayText)  
		print("-num" .. returnValue.num)  
		print("-scoreFormat" .. returnValue.scoreFormat)  
		print("-scores:")  
		for i, score in ipairs(returnValue) do  
			print("--Rank " .. score.rank)  
			print("---" .. score.scoreString .. " by " .. score.player.alias)  
		end  
	end  
end  
gamecircle.Leaderboard.GetScores(leaderboardId, "GLOBAL_WEEK", LeaderboardCallback)  
``````