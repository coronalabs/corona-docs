# gamecircle.Whispersync.GetLatestNumber

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [SyncableNumber][plugin.gamecircle.Whispersync.SyncableNumber]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Latest, SyncableNumber, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the latest number assigned to the key value. 


## Syntax
	local syncNum = gamecircle.Whispersync.GetLatestNumber(key, NT_constant)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific latest number.

##### NT_constant ~^(required)^~
_[String][api.type.String]._ The NT_constant, which is either "INT" or "DOUBLE", determins how the latest number will be stored. "INT" cutt off the decimal value. "DOUBLE" maintain the decimal value intact. If the string given is invalid, "INT" will be used by default.

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