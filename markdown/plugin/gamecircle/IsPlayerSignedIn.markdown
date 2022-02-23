# gamecircle.IsPlayerSignedIn()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          gamecircle, initialization, init  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
This function returns true when a valid user has been signed into GameCircle. A player is normally signed in all the time on recent amazon based devices, but for other platforms a sign in is sometimes required. Most if not all GameCircle calls still operate without a signed in player, but no interaction occures with the server until there is a player signed in.
	

## Syntax

``````lua
local result = gamecircle.IsPlayerSignedIn()
``````

## Examples

``````lua  
local gamecircle = require("plugin.gamecircle")   
gamecircle.Init(true, false, true)  
local state = "startup"  
Runtime:addEventListener("enterFrame", Update)  
function Update()  
	if state == "startup" and gamecircle.IsReady() then 
		if gamecircle.IsPlayerSignedIn()
			--From this point on you can start using GameCircle functions for achievements, leaderboards, & Whispersync.  
			state = "play"  
		end
	end  
end  
``````