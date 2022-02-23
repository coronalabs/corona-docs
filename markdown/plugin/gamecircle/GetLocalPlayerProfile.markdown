# gamecircle.GetLocalPlayerProfile()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          gamecircle, player, profile  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
This function allows you to fetch information about the player currently signed in with Amazon's services. 

## Syntax

``````lua
gamecircle.GetLocalPlayerPrifle(callback)
``````
	
##### callback ~^(required)^~
_[Function][api.type.Function]._ Pass to a callback function since the request requires the GameCircle SDK to contact Amazon's servers. The callback will recieve a single parameter of a [PlayerProfileReturn][gamecircle.PlayerProfileReturn].


## Examples

``````lua  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(true, false, true)  
function PlayerProfileCallback(returnValue)  
	if returnValue.isError == true then  
		print("Player Profile returned with error message: " .. returnValue.errorMessage)  
	else  
		print("PLayer Profile return with this info: " .. returnValue.player.alias .. "-" .. returnValue.player.id)  
	end  
end  
gamecircle.GetLocalPlayerProfile(PlayerProfileCallback)  
``````