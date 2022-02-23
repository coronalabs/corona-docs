# gamecircle.Whispersync.SetLowNumberListLength

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Low, List, SyncableNumberList, Length, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Set the max length of the LowNumber list. This number is capped at 1,000 by the Amazon GameCircle SDK. The default length is 5.


## Syntax
	gamecircle.Whispersync.SetLowNumberListLength(key, value)
	gamecircle.Whispersync.SetLowNumberListLength(key, value)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific lowest number.

##### value ~^(require)^~
_[Number][api.type.Number]._ The value to be assigned to the lowest number.


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
