# gamecircle.Leaderboard.PercentileReturn

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          achievement, return, value, table  
> --------------------- ------------------------------------------------------------------------------------------

## Overview
Table that encapulates the error values and return values from the [GetPercentileRanks][plugin.gamecircle.Leaderboard.GetPercentileRanks] function.
	
## Properties
- __isError__ - _[Boolean][api.type.Boolean]_  
	If the GameCircle SDK encountered an error, this value will be true.
- __errorMessage__ - _[String][api.type.String]_  
	If the GameCircle SDK encountered an error, this string will be populated with an error message.
- __leaderboard__ - _[Leaderboard][plugin.gamecircle.Leaderboard.Leaderboard]
	The information about the leaderboard the percentile statistics were generated from. 
- __userIndex__ - _[Number][api.type.Number]_  
	The index of the local user's score in the percentile statistics. The index will be -1 if the user does not have a score in the leaderboard.
- __num__ - _[Number][api.type.Number]_  
	The number of percentile items returned with the request.
- __[]__ ___Square Bracket Accessor___ - _[PercentileItem][plugin.gamecircle.Leaderboard.PercentileItem]_  
	The returned percentile statistics are stored as numerically-indexed entires on the table, ranging in value from 1 to "num". They can also be access using an ipairs interation, as in the example below.


## Example
 
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
