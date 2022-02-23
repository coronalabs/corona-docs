# gamecircle.Leaderboard.SubmitScore

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          leaderboard, score, submit, post       
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Submits a score to the leaderboard based on the Gamecirlce ID provided. The score is registred on the leaderboard under the name of the of the Amazon user currently signed in to the GameCircle service. 


## Syntax

	gamecircle.Leaderboard.SubmitScore( id, score )

##### id ~^(required)^~
_[String][api.type.String]._ The GameCircle ID of the achievement as set by the developer.

##### score ~^(required)^~
_[Number][api.type.Number]._ The number value of the score. The range of expected values can be set through Amazon's developer portal. 


## Examples

``````lua  
local leaderboardId = "myFirstLeaderboard"  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, true, false)  
gamecircle.Leaderboard.SubmitScore(leaderboardId, 8675307)  
``````