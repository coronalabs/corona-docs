# gamecircle.Leaderboard.GetScores

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          leaderboard, scores, get  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Use this function to fetch the scores from the leaderboard identified by the provided GameCircle ID.


## Syntax

	gamecircle.Leaderboard.GetScores( id, LF_constant, callback )


##### id ~^(required)^~
_[String][api.type.String]._ The GameCircle ID of the leaderboard.

##### LF_constant ~^(required)^~
_[String][api.type.String]._ This is the Leaderboard Filter constants and is use to related to the GameCircle SDK's inteneral enumerator. It has four valid values: "GLOBAL\_ALL\_TIME", "GLOBAL\_WEEK", "GLOBAL\_DAY", & "FRIENDS\_ALL\_TIME". If a string is put into this parameter that doesn't match one of these four strings, then the function will default to using "GLOBAL\_ALL\_TIME".

##### callback ~^(required)^~
_[Function][api.type.Function]._ The callback function for when the scores have been fetched. The callback will recieve a single parameter of type [GetScoresReturn][plugin.gamecircle.Leaderboard.GetScoresReturn]




## Examples

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
