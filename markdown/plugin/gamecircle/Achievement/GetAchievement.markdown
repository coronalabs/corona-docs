# gamecircle.Achievement.GetAchievement()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Achievement, get     
> --------------------- ------------------------------------------------------------------------------------------


## Overview
This function fetches an achievement's information based on the GameCircle ID assigned to it by the developer on Amazon's servers. 


## Syntax

	gamecircle.Achievement.GetAchievement( id, callback )

##### id ~^(required)^~
_[String][api.type.String]._ The GameCircle ID of the achievement to be fetched from Amazon's servers.

##### callback ~^(required)^~
_[Function][api.type.Function]._ The callback function for when the achievement's information has been fetched. The callback will recieve a single parameter of type [AchievementReturn][plugin.gamecircle.Achievement.AchievementReturn]

## Example

``````lua  
local achievementID = "myFirstAchievement"  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(true, false, false)  
function AchievementCallback(returnValue)  
	if returnValue.isError == true then  
		print("Get Achievement request returned with error message: " .. returnValue.errorMessage)  
	else  
		local achievement = returnValue.achievement  
		print("Achievement information recieved!")  
		print("-id: " .. achievement.id)  
		print("-title: " .. achievement.title)  
		print("-desc: " .. achievement.desc)  
		print("-isUnlocked: " .. achievement.isUnlocked)  
		print("-unlockedDate: " .. achievement.unlockDate)  
		print("-imageURL: " .. achievement.imageURL)  
		print("-isHidden: " .. achievement.isHidden)  
		print("-pointValue: " .. achievement.pointValue)  
		print("-position: " .. achievement.position)  
		print("-progress: " .. achievement.progress)  
	end  
end  
gamecircle.Achievement.GetAchievement(achievementID, AchievementCallback)  
``````
