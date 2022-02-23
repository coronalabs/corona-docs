# gamecircle.Whispersync.GetLatestString

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [SyncableString][plugin.gamecircle.Whispersync.SyncableString]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Latest, SyncableString, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the latest string assigned to the key value. 


## Syntax
	local syncString = gamecircle.Whispersync.GetLatestString( key )
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific latest string.

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