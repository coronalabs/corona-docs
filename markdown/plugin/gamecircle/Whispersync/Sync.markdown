# gamecircle.Whispersync.Sync

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Leaderboard, Overlay  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
This function will force the Whispersync systems to begin syncing it's local data with Amazon's cloud servers. This involves both pushing data as well as recieving any updated data from the cloud. Should not be called unnecessarily. Whispersync will automatically sync with the cloud periodically. 


## Syntax
	gamecircle.Whispersync.Sync()

## Examples

``````lua  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.Sync()  
``````