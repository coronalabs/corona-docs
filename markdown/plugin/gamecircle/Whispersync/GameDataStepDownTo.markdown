# gamecircle.Whispersync.GameDataStepDownTo

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None   
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Whispersync, GameData, Step, Down
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Step up one level in the GameData tree of Whispersync using the given "key". If the current GameData object doesn't have a child with the name "key", one will be created. THe object, however, won't be saved to the disk or cloud until some kind of data is assigned to it. 


## Syntax
	gamecircle.Whispersync.GameDataStepDownTo(key)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific string set.
	
## Examples

``````lua  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.GameDataStepDownTo("Level 1")  
print("Level 1 Path: " .. gamecircle.Whispersync.CurrentDataMapGetPath())  
gamecircle.Whispersync.GameDataStepDownTo("Treasures")  
gamecircle.Whispersync.GameDataStepUp()  
gamecircle.Whispersync.GameDataStepDownTo("Secrets")  
print("Secrets Path: " .. gamecircle.Whispersync.CurrentDataGetPath())  
gamecircle.Whispersync.GameDataStepUp()  
print("Level 1 Children: ")  
local keys = gamecircle.Whispersync.CurrentDataMapChildKeys()  
for i,key in ipairs(keys)  
	print("-" .. key)  
end  
gamecircle.Whispersync.GameDataReturnToRoot()  
``````

