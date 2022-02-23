# gamecircle.Achievement.GetAchievements

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          achievement, get  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
This function works like a mass-grab version of [GetAchievement][plugin.gamecircleAchievement.GetAchievement]. It fetches all the achievements setup on Amazon's servers for the app. 


## Syntax

	gamecircle.Achievement.GetAchievements( callback )

##### callback ~^(required)^~
_[Function][api.type.Function]._ The callback function for when the achievement's information has been fetched. The callback will recieve a single parameter of type [AchievementsReturn][plugin.gamecircleAchievement.AchievementsReturn]


## Examples

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
