# gamecircle.Whispersync.GetLowestNumberKeys

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [KeyTable][plugin.gamecircle.Whispersync.KeyTable]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Lowest, SyncableNumber, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the keys for all lowest number stored under the current Whispersync GameData level. The return value is a [KeyTable][plugin.gamecircle.Whispersync.KeyTable].


## Syntax
	local keys = gamecircle.Whispersync.GetLowestNumberKeys()
	
## Examples

``````lua  
local lowNumKey = "myFirstLowNumber" 
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.SetLowestNumber(lowNumKey, 10, "INT")  
gamecircle.Whispersync.SetLowestNumber(lowNumKey, 1000, "INT")  
gamecircle.Whispersync.SetLowestNumber(lowNumKey, 1, "INT")  
gamecircle.Whispersync.SetLowestNumber(lowNumKey, 10000, "INT")  
gamecircle.Whispersync.SetLowestNumber(lowNumKey, 100, "INT")  
print("The Lowest Number is: " .. gamecircle.Whispersync.GetLowestNumber(lowNumKey, "INT").value)  
print("These are all the Lowest Number values stored under the current GameData set of Whispersync.")  
local keys = gamecircle.Whispersync.GetLowestNumberKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  
``````
