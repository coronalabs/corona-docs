# gamecircle.Achievement.UpdateAchievement()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          achievement, update, post
> --------------------- ------------------------------------------------------------------------------------------


## Overview
This is the function used to send an update on the player's progress for an achievement to Amazon's servers. The value sent must be a percentage value between 0.0 and 100.0. Also, you can never update an achievement with a value lower than what it currently has. You can only update it with a higher value. Example: If a player has 50.0 percent progress on an achievement and your system sends an update for 40.0, then the achievement's progress will remain at 50.0. If you send an update for 60.0, however, the achievement's progress will update to 60.0.
	
When the achievement's progress is set to 100.0, the achievement will be marked as unlocked.


## Syntax

	gamecircle.Achivement.UpdateAchievement( id, percent )

##### id ~^(required)^~
_[String][api.type.String]._ The GameCircle ID of the achievement as set by the developer.

##### percent ~^(required)^~
_[Number][api.type.Number]._ The number value, between 0.0 and 100.0, that represents the percentage of a player's progress on an achievement.


## Examples

``````lua  
local achievementID = "myFirstAchievement"  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(true, false, false)  
gamecircle.Achievement.UpdateAchievement(achievementID, 100.0)  
``````
