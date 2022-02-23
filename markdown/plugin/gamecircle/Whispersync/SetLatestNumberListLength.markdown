# gamecircle.Whispersync.SetLatestNumberListLength

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Latest, List, SyncableNumberList, Length, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Set the max length of the LatestNumber list. This number is capped at 1,000 by the Amazon GameCircle SDK. The default length is 5.


## Syntax
	gamecircle.Whispersync.SetLatestNumberListLength(key, value)
	gamecircle.Whispersync.SetLatestNumberListLength(key, value)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific latest number.

##### value ~^(require)^~
_[Number][api.type.Number]._ The value to be assigned to the latest number.


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
