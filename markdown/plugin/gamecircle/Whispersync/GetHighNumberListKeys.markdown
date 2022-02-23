# gamecircle.Whispersync.GetHighNumberListKeys

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [KeyTable][plugin.gamecircle.Whispersync.KeyTable]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Highest, SyncableNumber, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the keys for the high number lists stored under the current Whispersync GameData level. The return value is a [KeyTable][plugin.gamecircle.Whispersync.KeyTable].


## Syntax
	local keys = gamecircle.Whispersync.GetHighNumberListKeys()
	
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
