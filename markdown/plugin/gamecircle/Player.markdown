# gamecircle.Player

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          player  
> --------------------- ------------------------------------------------------------------------------------------

## Overview
A representation of the player data returned by GameCircle SDK for some functions.
	
## Properties
- __alias__ - _[String][api.type.String]_  
	The player's GameCircle profile name.
- __id__ - _[String][api.type.String]_  
	A unique identifier assigned to the player by Amazon.
- __avatarUrl__ - _[String][api.type.String]_  
	A url address to the users GameCircle Avatar. 


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