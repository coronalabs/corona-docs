# gamecircle.Whispersync.GetLatestStringList

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [SyncableString][plugin.gamecircle.Whispersync.SyncableString]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Latest, List, SyncableStringList, Whispersync    
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the latest string list as a [SyncableStringList][plugin.gamecircle.Whispersync.SyncableStringList]


## Syntax
	local syncStringList = gamecircle.Whispersync.GetLatestStringList(key, NT_constant)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific latest string.


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
print("Here is the list of strings as they are stored in the latest string list. They should be in the order from latest to oldest.")  
local latestList = gamecircle.Whispersync.GetLatestStringList(latestListKey)  
for i,entry in ipairs(latestList) do  
	print("-" entry.value)  
end  
local keys = gamecircle.Whispersync.GetLatestStringListKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  
``````