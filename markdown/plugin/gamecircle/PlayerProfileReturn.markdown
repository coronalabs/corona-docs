# gamecircle.PlayerProfileReturn

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          player, return, value, table  
> --------------------- ------------------------------------------------------------------------------------------

## Overview
Table that encapulates the error values and return value from the [GetLocalPlayerProfile][plugin.gamecircle.GetLocalPlayerProfile] function.
	
## Properties
- __isError__ - _[Boolean][api.type.Boolean]_  
	If the GameCircle SDK encountered an error, this value will be true.
- __errorMessage__ - _[String][api.type.String]_  
	If the GameCircle SDK encountered an error, this string will be populated with an error message.
- __player__ - _[Player][gamecircle.Player]_  
	If GameCircle SDK completed the request without an error, the player's info will be populated to this table. 

## Example
 
``````lua
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(true, false, true)  
function PlayerProfileCallback(returnValue)  
	if returnValue.isError == true then  
		print("Player Profile returned with error message: " .. returnValue.errorMessage)  
	else  
		print("Player Profile return with this info: " .. returnValue.player.alias .. "-" .. returnValue.player.id)  
	end  
end  
``````