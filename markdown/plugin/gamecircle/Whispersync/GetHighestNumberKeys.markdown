# gamecircle.Whispersync.GetHighestNumberKeys

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [KeyTable][plugin.gamecircle.Whispersync.KeyTable]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Highest, SyncableNumber, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the keys for all highest number stored under the current Whispersync GameData level. The return value is a [KeyTable][plugin.gamecircle.Whispersync.KeyTable].


## Syntax
	local keys = gamecircle.Whispersync.GetHighestNumberKeys()
	
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