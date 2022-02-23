# gamecircle.Whispersync.CurrentDataMapContainsChild

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [Boolean][api.type.Boolean]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Whispersync, GameData, Contains 
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns true if the key given corresponds to a child of the current GameData object. Otherwise, it returns false. 

## Syntax
	gamecircle.Whispersync.CurrentDataMapContainsChild(key)
	
##### key ~^(required)^~
_[String][api.type.String]._ The name of the GameData we want to check the existance of as a child to the current GameData


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
