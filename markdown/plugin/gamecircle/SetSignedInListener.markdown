# gamecircle.SetSignedInListener()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Leaderboard, Overlay  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Will register a callback with the GameCircle system that will alert the lua code if/when the players sign-in status changes. 


## Syntax
	gamecircle.SetSignedInListener( callback )

##### callback ~^(required)^~
_[Function][api.type.Function]._ The callback function for events propegated by Whispersync.

## Information on Callback Function
Your callback function should have a single, boolean parameter. This parameter will be true when a new user signs in, and false when the current user signs out.    

## Examples

``````lua  
local gamecircle = require("plugin.gamecircle")    
gamecircle.Init(false, false, true)  
function SignedInCallback(result)  
	if result then  
		print("Player Signed In")  
	else
		print("Player SIgned Out")
	end
end  
gamecircle.SetSignedInListener(SignedInCallback)  
``````
