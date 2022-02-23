# gamecircle.Whispersync.AddToLowNumberList

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Low, List, SyncableNumberList, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Add a value to a LowNumberList. If the number is lower than the highest number stored in the list, then it will be added. And then, if the list exceeds it's maximum length, the number that is currently highest in the whole list will be trimmed off.

## Syntax
	gamecircle.Whispersync.AddToLowNumberList(key, value, NT_constant)
	gamecircle.Whispersync.AddToLowNumberList(key, value, NT_constant, metadata)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific lowest number.

##### value ~^(require)^~
_[Number][api.type.Number]._ The value to be assigned to the lowest number.

##### NT_constant ~^(required)^~
_[String][api.type.String]._ The NT_constant, which is either "INT" or "DOUBLE", determins how the lowest number will be stored. "INT" cutt off the decimal value. "DOUBLE" maintain the decimal value intact. If the string given is invalid, "INT" will be used by default.

##### metadata ~^(optional)^~
_[Metadata][plugin.gamecircle.Whispersync.Metadata]._ A table of metadata to be stored with the number. It must be a lua table comprised only of string fields with string values in those fields. For examples and more information, check the documentation page for metadata. 

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
