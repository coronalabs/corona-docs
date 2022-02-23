# gamecircle.Whispersync.GetLatestStringKeys

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [KeyTable][plugin.gamecircle.Whispersync.KeyTable]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Latest, SyncableString, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the keys for all latest string stored under the current Whispersync GameData level. The return value is a [KeyTable][plugin.gamecircle.Whispersync.KeyTable].


## Syntax
	local keys = gamecircle.Whispersync.GetLatestStringKeys()
	
## Examples

``````lua  
local latestNumKey = "myFirstLatestString"  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.SetLatestString(latestNumKey, "A")
gamecircle.Whispersync.SetLatestString(latestNumKey, "B") 
gamecircle.Whispersync.SetLatestString(latestNumKey, "C")
gamecircle.Whispersync.SetLatestString(latestNumKey, "D") 
gamecircle.Whispersync.SetLatestString(latestNumKey, "E") 
print("The Latest String is: " .. gamecircle.Whispersync.GetLatestString(latestNumKey, "INT").value)  
print("These are all the Latest String values stored under the current GameData set of Whispersync.")  
local keys = gamecircle.Whispersync.GetLatestStringKeys()  
for i,key in ipairs(keys) do   
	print("-" .. key)  
end  
``````
