# gamecircle.Whispersync.Flush

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Leaderboard, Overlay  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
This function will force the Whispersync systems to write the current game data to local storage. Should not be called unnecessarily. Whiserpsync will write to the disk automatically periodically.


## Syntax
	gamecircle.Whispersync.Flush()

## Examples

``````lua  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.Flush()  
``````