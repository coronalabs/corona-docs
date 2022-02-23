# gamecircle.Leaderboard.LeaderboardsReturn

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          achievement, return, value, table  
> --------------------- ------------------------------------------------------------------------------------------

## Overview
Table that encapulates the error values and return values from the [GetLeaderboards][plugin.gamecircle.Leaderboard.GetLeaderboards] function.
	
## Properties
- __isError__ - _[Boolean][api.type.Boolean]_  
	If the GameCircle SDK encountered an error, this value will be true.
- __errorMessage__ - _[String][api.type.String]_  
	If the GameCircle SDK encountered an error, this string will be populated with an error message.
- __num__ - _[Number][api.type.Number]_  
	The number of leaderboards returned with the request. 
- __[]__ ___Square Bracket Accessor___ - _[Leaderboard][plugin.gamecircle.Leaderboard.Leaderboard]_  
	The returned leadearboards are stored as numerically-indexed entires on the table, ranging in value from 1 to "num". They can also be access using an ipairs interation, as in the example below.


## Example
 
``````lua  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, true, false)  
function LeaderboardCallback(returnValue)  
	if returnValue.isError == true then  
		print("Get Leaderboards request returned with error message: " .. returnValue.errorMessage)  
	else  
		print("Leaderboard information recieved!")  
		print("-num" .. returnValue.num)  
		for i, leaderboard in ipairs(returnValue) do  
			print("-Leaderboard ID" .. leaderboard.id)  
			print("--name" .. leaderboard.name)  
			print("--displayText" .. leaderboard.displayText)  
			print("--scoreFormat" .. leaderboard.scoreFormat)  
			print("--imageURL" .. leaderboard.imageURL)  
			print("--imageURL may be blank, as warned by Amazon's SDK documentation, when propegated outside basic GetLeaderboards function")  
		end  
	end  
end  
gamecircle.Leaderboard.GetLeaderboards(LeaderboardCallback) 
``````