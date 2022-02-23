# gamecircle.Whispersync.CurrentDataMapChildKeys

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [KeyTable][plugin.gamecircle.Whispersync.KeyTable]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Whispersync, GameData, Keys
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the keys for the children of the current GameData object.


## Syntax
	local keys = gamecircle.Whispersync.CurrentDataMapChildKeys()
	
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
