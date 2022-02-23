# gamecircle.Leaderboard.GetPercentileRanks

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          leaderboard, get  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Use this function to fetch the percentile statistical information for a leaderboard


## Syntax

	gamecircle.Leaderboard.GetPercentileRanks( id, LF_constant, callback )

##### id ~^(required)^~
_[String][api.type.String]._ The GameCircle ID of the leaderboard we want percentile statistics of.

##### LF_constant ~^(required)^~
_[String][api.type.String]._ This is the Leaderboard Filter constants and is use to related to the GameCircle SDK's inteneral enumerator. It has four valid values: "GLOBAL\_ALL\_TIME", "GLOBAL\_WEEK", "GLOBAL\_DAY", & "FRIENDS\_ALL\_TIME". If a string is put into this parameter that doesn't match one of these four strings, then the function will default to using "GLOBAL\_ALL\_TIME".

##### callback ~^(required)^~
_[Function][api.type.Function]._ The callback function for when the percentile statistsc have been fetched. The callback will recieve a single parameter of type [PercentileReturn][plugin.gamecircle.Leaderboard.PercentileReturn]




## Examples

``````lua  
local leaderboardId = "myFirstLeaderboard"  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, true, false)  
function LeaderboardCallback(returnValue)  
	 if returnValue.isError == true then  
		print("Get Percentile request returned with error message: " .. returnValue.errorMessage)  
	else  
		print("Percentile information returned for leaderboard " .. returnValue.leaderboard.name)  
		print("The local user's index in the list is : " .. returnValue.userIndex)  
		print("-(-1 means user is not on leaderboard)")  
		print("Here is the statistical information:")  
		for i,stat in ipairs(returnValue) do  
			print("#" .. i .. " " .. stat.playerAlias .. "-" .. stat.playerScore .. "-" .. percentile)  
		end  
	end  
end  
gamecircle.Leaderboard.GetPercentileRanks(leaderboardId, "GLOBAL_WEEK", LeaderboardCallback)  
``````
