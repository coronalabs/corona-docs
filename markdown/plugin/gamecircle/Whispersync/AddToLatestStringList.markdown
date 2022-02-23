# gamecircle.Whispersync.AddToLatestStringList

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Latest, List, SyncableStringList, Whispersync     
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Add a value to a LatestStringList. The latest string will most likely be added to the top of the list. Then, if the list exceeds it's maximum length, the string that is currently oldest in the list will be trimmed off.

## Syntax
	gamecircle.Whispersync.AddToLatestStringList(key, value)
	gamecircle.Whispersync.AddToLatestStringList(key, value, metadata)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific latest string.

##### value ~^(require)^~
_[String][api.type.String]._ The value to be assigned to the latest string.

##### metadata ~^(optional)^~
_[Metadata][plugin.gamecircle.Whispersync.Metadata]._ A table of metadata to be stored with the string. It must be a lua table comprised only of string fields with string values in those fields. For examples and more information, check the documentation page for metadata. 

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
