# gamecircle.Leaderboard.PercentileItem

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          achievement  
> --------------------- ------------------------------------------------------------------------------------------

## Overview
A representation of the statistical percentile data returned by GameCircle SDK for some functions.
	
## Properties
- __player__ - _[Player][gamecircle.Player]_ 
	The information about the local player
- __playerScore__ - _[Number][api.type.Number]_  
	The player's score of the stat item represented as anumber. 
- __percentile__ - _[Number][api.type.Number]_    
	The statistical percentile rank of the associated player & score. 

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