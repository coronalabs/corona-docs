# gamecircle.IsReady()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          gamecircle, initialization, init  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
This function returns true when the GameCircle systems have finished initializing. This needs to return true after calling Init() before you do any GameCircle operations. Otherwise, you run the risk of a Runtime Null-Reference Error. 
	

## Syntax

``````lua
local result = gamecircle.IsReady()
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