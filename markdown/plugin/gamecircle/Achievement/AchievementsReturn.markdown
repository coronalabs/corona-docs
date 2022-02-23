# gamecircle.Achievement.AchievementsReturn

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          achievement, return, value, table  
> --------------------- ------------------------------------------------------------------------------------------

## Overview
Table that encapulates the error values and return values from the [GetAchievements][plugin.gamecircleAchievement.GetAchievements] function.
	
## Properties
- __isError__ - _[Boolean][api.type.Boolean]_  
	If the GameCircle SDK encountered an error, this value will be true.
- __errorMessage__ - _[String][api.type.String]_  
	If the GameCircle SDK encountered an error, this string will be populated with an error message.
- __num__ - _[Number][api.type.Number]_  
	The number of achievements returned with the request. 
- __[]__ ___Square Bracket Accessor___ - _[Achievement][plugin.gamecircleAchievement.Achievement]_  
	The returned achievements are stored as numerically-indexed entires on the table, ranging in value from 1 to "num". They can also be access using an ipairs interation, as in the example below.


## Example
 
``````lua
local achievementID = "myFirstAchievement"  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(true, false, false)  
function AchievementCallback(returnValue)  
	if returnValue.isError == true then  
		print("Get Achievement request returned with error message: " .. returnValue.errorMessage)  
	else  
		print("Achievement information recieved!")  
		for i, achievement in ipairs(returnValue) do  
			print("-Achievement # " .. i)  
			print("--id: " .. achievement.id)  
			print("--title: " .. achievement.title)  
			print("--desc: " .. achievement.desc)  
			print("--isUnlocked: " .. achievement.isUnlocked)  
			print("--unlockedDate: " .. achievement.unlockDate)  
			print("--imageURL: " .. achievement.imageURL)  
			print("--isHidden: " .. achievement.isHidden)  
			print("--pointValue: " .. achievement.pointValue)  
			print("--position: " .. achievement.position)  
			print("--progress: " .. achievement.progress)  
		end  
	end  
end  
gamecircle.Achievement.GetAchievements(achievementID, AchievementCallback)  
``````