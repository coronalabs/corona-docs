# gamecircle.Leaderboard.OpenOverlay

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Leaderboard, Overlay  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
This function will make the GameCircle SDK open it's own Leaderboard overlay on top of the current application. This will allow users to see their position on a leaderboard or all available leaderboards.


## Syntax
	gamecircle.Leaderboard.OpenOverlay()
	gamecircle.Leaderboard.OpenOverlay(id)
	
## Optional Arguements
##### id
_[String][api.type.String]._ The Gamecircle ID of the leaderboard that is to be displayed in the overlay. If the parameter is not given, the GameCircle system will open an overlay displaying all of the game's available leaderbaords.


## Examples

``````lua  
local leaderboardId = "myFirstLeaderboard"  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, true, false)  
gamecircle.Leaderboard.OpenOverlay(leaderboardId)  
``````