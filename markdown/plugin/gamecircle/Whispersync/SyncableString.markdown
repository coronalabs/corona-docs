# gamecircle.Whispersync.SyncableString

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          whispersync, string
> --------------------- ------------------------------------------------------------------------------------------

## Overview
A lua table returned by the functions like [GetLatestString][plugin.gamecircle.Whispersync.GetLatestString].
	
## Properties
- __value__ - _[String][api.type.String]_  
	The value of the string associated with the table. 
- __timestamp__ - _[Number][api.type.Number]_  
	The timestamp of the locally saved developer string value, represented as the amount of time since January 1st, 1970
- __metadataPresent__ - _[Boolean][api.type.Boolean]_  
	If true, there is metadata that was submitted with this string
- __metadata__ - _[Metadata][plugin.gamecircle.Whispersync.metadata]_  
	The metadata of the object if it was included in the "Set" function.
- __isSet__ - _[Boolean][api.type.Boolean]_  
	Boolean represents whether or not a value has been assigned yet. Changes to true after the first assignment. 
	
## Example
 
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