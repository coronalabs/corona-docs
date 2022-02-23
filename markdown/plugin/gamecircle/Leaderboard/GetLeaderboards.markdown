# gamecircle.Leaderboard.GetLeaderboards

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          leaderboard, get  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Use this function to fetch all the leaderboards associated with a particular app.


## Syntax

	gamecircle.Leaderboard.GetLeaderboards( callback )

##### callback ~^(required)^~
_[Function][api.type.Function]._ The callback function for when the scores have been fetched. The callback will recieve a single parameter of type [GetLeaderboardsReturn][plugin.gamecircle.Leaderboard.LeaderboardsReturn]




## Examples

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
