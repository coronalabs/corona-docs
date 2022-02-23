# gamecircle.Whispersync.SetLatestString

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Latest, SyncableString, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Set a value to the latest string associated with the key. Only the latest value assigned will be stored. 


## Syntax
	gamecircle.Whispersync.SetLatestString(key, value)
	gamecircle.Whispersync.SetLatestString(key, value, metadata)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific latest string.

##### value ~^(require)^~
_[String][api.type.String]._ The value to be assigned to the latest string.

##### metadata ~^(optional)^~
_[Metadata][plugin.gamecircle.Whispersync.Metadata]._ A table of metadata to be stored with the string. It must be a lua table comprised only of string fields with string values in those fields. For examples and more information, check the documentation page for metadata. 

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
