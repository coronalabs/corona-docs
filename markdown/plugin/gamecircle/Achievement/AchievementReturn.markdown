# gamecircle.Achievement.AchievementReturn

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          achievement, return, value, table  
> --------------------- ------------------------------------------------------------------------------------------

## Overview
Table that encapulates the error values and return value from the [GetAchievement][plugin.gamecircle.Achievement.GetAchievement] function.
	
## Properties
- __isError__ - _[Boolean][api.type.Boolean]_  
	If the GameCircle SDK encountered an error, this value will be true.
- __errorMessage__ - _[String][api.type.String]_  
	If the GameCircle SDK encountered an error, this string will be populated with an error message.
- __achievement__ - _[Achievement][plugin.gamecircle.Achievement.Achievement]_  
	If GameCircle SDK completed the request without an error, the achievement's info will be populated to this table. 


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
gamecircle.GetAchievement(achievementID, AchievementCallback)
``````
