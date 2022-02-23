# gamecircle.Whispersync.GetLatestNumberListKeys

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [KeyTable][plugin.gamecircle.Whispersync.KeyTable]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Latest, List, SyncableNumberList, Whispersync   
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the keys for the latest number lists stored under the current Whispersync GameData level. The return value is a [KeyTable][plugin.gamecircle.Whispersync.KeyTable].


## Syntax
	local keys = gamecircle.Whispersync.GetLatestNumberListKeys()
	
## Examples

``````lua  
local latestListKey = "myFirstLatestNumberList" 
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.SetLatestNumberListLength(latestListKey, 4)  
gamecircle.Whispersync.AddToLatestNumberList(latestListKey, 10, "INT")  
gamecircle.Whispersync.AddToLatestNumberList(latestListKey, 1000, "INT")  
gamecircle.Whispersync.AddToLatestNumberList(latestListKey, 1, "INT")  
gamecircle.Whispersync.AddToLatestNumberList(latestListKey, 10000, "INT")   
gamecircle.Whispersync.AddToLatestNumberList(latestListKey, 100, "INT")  
print("Here is the list of numbers as they are stored in the latest number list. They should be in the order from latest to oldest.")  
local latestList = gamecircle.Whispersync.GetLatestNumberList(latestListKey)  
for i,entry in ipairs(latestList) do  
	print("-" entry.value)  
end  
local keys = gamecircle.Whispersync.GetLatestNumberListKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  
``````
