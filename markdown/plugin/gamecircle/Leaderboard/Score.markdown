# gamecircle.Leaderboard.Score

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          achievement  
> --------------------- ------------------------------------------------------------------------------------------

## Overview
A representation of the score data returned by GameCircle SDK for some functions.
	
## Properties
- __leaderboard__ - _[String][api.type.String]_ 
	The string ID of the leaderboard the score belongs too. 
- __rank__ - _[Number][api.type.Number]_  
	The rank of the score on it's given leaderboard table based on the chosen leaderboard filter.
- __scoreString__ - _[String][api.type.String]_  
	The score represented as a string.
- __scoreNumber__ - _[Number][api.type.Number]_  
	The score represented as a number. 
- __player__ - _[Player][plugin.gamecircle.Player]_  
	The information of the player who achieved the coresponding score & rank.

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