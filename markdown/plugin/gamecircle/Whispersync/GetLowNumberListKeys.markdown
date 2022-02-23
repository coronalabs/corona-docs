# gamecircle.Whispersync.GetLowNumberListKeys

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [KeyTable][plugin.gamecircle.Whispersync.KeyTable]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Low, List, SyncableNumberList, Whispersync 
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the keys for the low number lists stored under the current Whispersync GameData level. The return value is a [KeyTable][plugin.gamecircle.Whispersync.KeyTable].


## Syntax
	local keys = gamecircle.Whispersync.GetLowNumberListKeys()
	
## Examples

``````lua  
local lowListKey = "myFirstLowNumberList" 
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.SetLowNumberListLength(lowListKey, 4)  
gamecircle.Whispersync.AddToLowNumberList(lowListKey, 10, "INT")  
gamecircle.Whispersync.AddToLowNumberList(lowListKey, 1000, "INT")  
gamecircle.Whispersync.AddToLowNumberList(lowListKey, 1, "INT")  
gamecircle.Whispersync.AddToLowNumberList(lowListKey, 10000, "INT")   
gamecircle.Whispersync.AddToLowNumberList(lowListKey, 100, "INT")  
print("Here is the list of numbers as they are stored in the low number list. They should be in the order from lowest to highest.")  
local lowList = gamecircle.Whispersync.GetLowNumberList(lowListKey)  
for i,entry in ipairs(lowList) do  
	print("-" entry.value)  
end  
local keys = gamecircle.Whispersync.GetLowNumberListKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  
``````
