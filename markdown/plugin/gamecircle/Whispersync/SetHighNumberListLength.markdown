# gamecircle.Whispersync.SetHighNumberListLength

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          High, List, SyncableNumberList, Length, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Set the max length of the HighNumber list. This number is capped at 1,000 by the Amazon GameCircle SDK. The default length is 5.


## Syntax
	gamecircle.Whispersync.SetHighNumberListLength(key, value)
	gamecircle.Whispersync.SetHighNumberListLength(key, value)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific highest number.

##### value ~^(require)^~
_[Number][api.type.Number]._ The value to be assigned to the highest number.


## Examples

``````lua  
local highListKey = "myFirstHighNumberList" 
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.SetHighNumberListLength(highListKey, 4)  
gamecircle.Whispersync.AddToHighNumberList(highListKey, 10, "INT")  
gamecircle.Whispersync.AddToHighNumberList(highListKey, 1000, "INT")  
gamecircle.Whispersync.AddToHighNumberList(highListKey, 1, "INT")  
gamecircle.Whispersync.AddToHighNumberList(highListKey, 10000, "INT")   
gamecircle.Whispersync.AddToHighNumberList(highListKey, 100, "INT")  
print("Here is the list of numbers as they are stored in the high number list. They should be in the order from highest to lowest.")  
local highList = gamecircle.Whispersync.GetHighNumberList(highListKey)  
for i,entry in ipairs(highList) do  
	print("-" entry.value)  
end  
local keys = gamecircle.Whispersync.GetHighNumberListKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  
``````
