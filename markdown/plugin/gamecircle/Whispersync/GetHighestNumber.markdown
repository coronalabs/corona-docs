# gamecircle.Whispersync.GetHighestNumber

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [SyncableNumber][plugin.gamecircle.Whispersync.SyncableNumber]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Highest, SyncableNumber, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the highest number ever assigned to the key value. 


## Syntax
	local syncNum = gamecircle.Whispersync.GetHighestNumber(key, NT_constant)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific highest number.

##### NT_constant ~^(required)^~
_[String][api.type.String]._ The NT_constant, which is either "INT" or "DOUBLE", determins how the highest number will be stored. "INT" cutt off the decimal value. "DOUBLE" maintain the decimal value intact. If the string given is invalid, "INT" will be used by default.

## Examples

``````lua 
local highNumKey = "myFirstHighNumber" 
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.SetHighestNumber(highNumKey, 10, "INT")  
gamecircle.Whispersync.SetHighestNumber(highNumKey, 1000, "INT")  
gamecircle.Whispersync.SetHighestNumber(highNumKey, 1, "INT")  
gamecircle.Whispersync.SetHighestNumber(highNumKey, 10000, "INT")  
gamecircle.Whispersync.SetHighestNumber(highNumKey, 100, "INT")  
print("The Highest Number is: " .. gamecircle.Whispersync.GetHighestNumber(highNumKey, "INT").value)  
print("These are all the Highest Number values stored under the current GameData set of Whispersync.")  
local keys = gamecircle.Whispersync.GetHighestNumberKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  
``````