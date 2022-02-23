# gamecircle.Leaderboard.Leaderboard

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          achievement  
> --------------------- ------------------------------------------------------------------------------------------

## Overview
A representation of the leaderboard data returned by GameCircle SDK for some functions.
	
## Properties
- __id__ - _[String][api.type.String]_ 
	The GameCircle ID of the leaderboard.
- __name__ - _[String][api.type.String]_ 
	The name of the leaderboard.
- __displayText__ - _[String][api.type.String]_ 
	The informative display text for the leaderboard.
- __imageURL__ - _[String][api.type.String]_ 
	The URL to the leaderboard's image as stored on Amazon's servers. 
- __scoreFormat__ - _[String][api.type.String]_ 
	A string giving details of how the leaderboard's scores are formated. 

## Example
 
``````lua  
local leaderboardId = "myFirstLeaderboard"  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, true, false)  
function LeaderboardCallback(returnValue)  
	if returnValue.isError == true then  
		print("Get Scores request returned with error message: " .. returnValue.errorMessage)  
	else  
		print("Leaderboard information recieved!")  
		print("-num" .. returnValue.num)  
		for i, leaderboard in ipairs(returnValue) do   
			print("-Leaderboard ID" .. leaderboard.id)  
			print("--name" .. leaderboard.name)  
			print("--displayText" .. leaderboard.displayText)  
			print("--scoreFormat" .. leaderboard.scoreFormat)  
			print("--imageURL" .. leaderboard.imageURL)  
			print("--imageURL may be blank, as warned by Amazon's SDK documentation, when propegated outside basic GetLeaderboard function")  
		end  
	end  
end  
gamecircle.Leaderboard.GetLeaderboards(LeaderboardCallback)  
``````

