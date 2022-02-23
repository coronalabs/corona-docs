# gamecircle.Whispersync.GetLatestNumberKeys

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [KeyTable][plugin.gamecircle.Whispersync.KeyTable]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Latest, SyncableNumber, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the keys for all latest number stored under the current Whispersync GameData level. The return value is a [KeyTable][plugin.gamecircle.Whispersync.KeyTable].


## Syntax
	local keys = gamecircle.Whispersync.GetLatestNumberKeys()
	
## Examples

``````lua  
local latestNumKey = "myFirstLatestNumber" 
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.SetLatestNumber(latestNumKey, 10, "INT")  
gamecircle.Whispersync.SetLatestNumber(latestNumKey, 1000, "INT")  
gamecircle.Whispersync.SetLatestNumber(latestNumKey, 1, "INT")  
gamecircle.Whispersync.SetLatestNumber(latestNumKey, 10000, "INT")  
gamecircle.Whispersync.SetLatestNumber(latestNumKey, 100, "INT")  
print("The Latest Number is: " .. gamecircle.Whispersync.GetLatestNumber(latestNumKey, "INT").value)  
print("These are all the Latest Number values stored under the current GameData set of Whispersync.")  
local keys = gamecircle.Whispersync.GetLatestNumberKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  
``````
