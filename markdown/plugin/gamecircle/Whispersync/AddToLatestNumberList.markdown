# gamecircle.Whispersync.AddToLatestNumberList

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Latest, List, SyncableNumberList, Whispersync     
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Add a value to a LatestNumberList. THe number will, most likely, be added to the top of the list as the newest entry Then, if the list exceeds it's maximum length, the number that is currently the oldest in the whole list will be trimmed off.

## Syntax
	gamecircle.Whispersync.AddToLatestNumberList(key, value, NT_constant)
	gamecircle.Whispersync.AddToLatestNumberList(key, value, NT_constant, metadata)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific latest number.

##### value ~^(require)^~
_[Number][api.type.Number]._ The value to be assigned to the latest number.

##### NT_constant ~^(required)^~
_[String][api.type.String]._ The NT_constant, which is either "INT" or "DOUBLE", determins how the latest number will be stored. "INT" cutt off the decimal value. "DOUBLE" maintain the decimal value intact. If the string given is invalid, "INT" will be used by default.

##### metadata ~^(optional)^~
_[Metadata][plugin.gamecircle.Whispersync.Metadata]._ A table of metadata to be stored with the number. It must be a lua table comprised only of string fields with string values in those fields. For examples and more information, check the documentation page for metadata. 

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
