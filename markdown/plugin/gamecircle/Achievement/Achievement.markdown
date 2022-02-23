# gamecircle.Achievement.Achievement

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          achievement  
> --------------------- ------------------------------------------------------------------------------------------

## Overview
A representation of the achievement data returned by GameCircle SDK for some functions.
	
## Properties
- __id__ - _[String][api.type.String]_  
	The GameCircle ID of the achievement.
- __title__ - _[String][api.type.String]_  
	The proper name of the achievement.
- __desc__ - _[String][api.type.String]_  
	The description given of the achievement. This can change depending on whether or not the achievement is unlocked, since Amazon's servers will send either the unlocked or locked description that was provided by the developer.
- __isUnlocked__ - _[Boolean][api.type.Boolean]_  
	Is true if the achievement has been unlocked on the player's profile.
- __unlockDate__ - _[String][api.type.String]_  
	If the achievement has not yet been unlocked, this string will be empty. If it has been unlocked, the date will be represented in the format of "MM/dd/yyyy HH:mm:ss". 
- __isHidden__ - _[Boolean][api.type.Boolean]_ 
	Is true/false depending on whether or not the developer has set the achievement to be hidden or not through Amazon's developer portal. Is used primarily for achievements you don't want to show the details of until after they've been unlocked. 
- __pointValue__ - _[Number][api.type.Number]_  
	Is the point value assigned to an achievement by the developer. Check Amazon's documentaiton for rules regarding assigning point values to achievements. 
- __position__ - _[Number][api.type.Number]_  
	Is the index value of the achievement in the list on Amazon's servers. 
- __progress__ - _[Number][api.type.Number]_  
	Is the decimal number representing the current percentage progress to the achievement's completion. Value returned is from 0.0 to 100.0
- __imageURL__ - _[String][api.type.String]_  
	A URL pointing to the achievements associated image. The image returned will depend on whether or not the achievement has been unlocked. 

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