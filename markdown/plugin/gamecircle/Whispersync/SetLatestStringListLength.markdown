# gamecircle.Whispersync.SetLatestStringListLength

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Latest, List, SyncableStringList, Length, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Set the max length of the LatestString list. This length is capped at 1,000 by the Amazon GameCircle SDK. The default length is 5.


## Syntax
	gamecircle.Whispersync.SetLatestStringListLength(key, value)
	gamecircle.Whispersync.SetLatestStringListLength(key, value)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific latest number.

##### value ~^(require)^~
_[Number][api.type.Number]._ The value to be assigned to the latest number.


## Examples

``````lua  
local latestListKey = "myFirstLatestStringList"  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.SetLatestStringListLength(latestListKey, 4)  
gamecircle.Whispersync.AddToLatestStringList(latestListKey, "A")
gamecircle.Whispersync.AddToLatestStringList(latestListKey, "B")
gamecircle.Whispersync.AddToLatestStringList(latestListKey, "C")
gamecircle.Whispersync.AddToLatestStringList(latestListKey, "D") 
gamecircle.Whispersync.AddToLatestStringList(latestListKey, "E") 
print("Here is the list of numbers as they are stored in the latest number list. They should be in the order from latest to oldest.")  
local latestList = gamecircle.Whispersync.GetLatestStringList(latestListKey)  
for i,entry in ipairs(latestList) do  
	print("-" entry.value)  
end  
local keys = gamecircle.Whispersync.GetLatestStringListKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  
``````
