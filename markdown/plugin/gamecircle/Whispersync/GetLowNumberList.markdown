# gamecircle.Whispersync.GetLowNumberList

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [SyncableNumber][plugin.gamecircle.Whispersync.SyncableNumber]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Low, List, SyncableNumberList, Whispersync 
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the low number list as a [SyncableNumberList][plugin.gamecircle.Whispersync.SyncableNumberList]


## Syntax
	local syncNumList = gamecircle.Whispersync.GetLowNumberList(key, NT_constant)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific lowest number.

##### NT_constant ~^(required)^~
_[String][api.type.String]._ The NT_constant, which is either "INT" or "DOUBLE", determins how the lowest number will be stored. "INT" cutt off the decimal value. "DOUBLE" maintain the decimal value intact. If the string given is invalid, "INT" will be used by default.

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
print("Here is the list of numbers as they are stored in the low number list. They should be in the order from lowest to  highest.")  
local lowList = gamecircle.Whispersync.GetLowNumberList(lowListKey)  
for i,entry in ipairs(lowList) do  
	print("-" entry.value)  
end  
local keys = gamecircle.Whispersync.GetLowNumberListKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  
``````