# gamecircle.Whispersync.CurrentDataMapGetPath

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Whispersync, GameData, Path, Current 
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns a string, seperated by “|”, of the parents to the current DataMap node. The string will end with a "|" after the name of the current node is listed. If the user is at the root of the GameData tree, the string returned will be "root|"

## Syntax
	gamecircle.Whispersync.CurrentDataMapGetPath()

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
