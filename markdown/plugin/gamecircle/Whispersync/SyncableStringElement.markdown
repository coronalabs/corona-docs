# gamecircle.Whispersync.SyncableStringElement

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          whispersync, string, list, element
> --------------------- ------------------------------------------------------------------------------------------

## Overview
A single element in a [SyncableStringList][plugin.gamecircle.Whispersync.SyncableStringList].
	
## Properties
- __value__ - _[String][api.type.String]_  
	The string value associated with the SyncableStringElement
- __metadataPresent__ - _[Boolean][api.type.Boolean]_  
	If true, there is metadata that was submitted with this string
- __metadata__ - _[Metadata][plugin.gamecircle.Whispersync.metadata]_  
	The metadata of the object if it was included in the "Set" function.
- __timestamp__ - _[Number][api.type.Number]_  
	The timestamp of when the value was added to the list. It is the time passed since January 1st, 1970.
	
## Example
 
``````lua  
local latestListKey = "myFirstLatestStringList"  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.SetLatestStringListLength(latestListKey, 4)  
gamecircle.Whispersync.AddToLatestStringList(latestListKey, "A")
gamecircle.Whispersync.AddToLatestStringList(latestListKey, "B")
gamecircle.Whispersync.AddToLatestStringList(latestListKey, "C")
gamecircle.Whispersync.AddToLatestStringList(latestListKey, "D") 
gamecircle.Whispersync.AddToLatestStringList(latestListKey, "E") 
print("Here is the list of strings as they are stored in the latest string list. They should be in the order from latest to oldest.")  
local latestList = gamecircle.Whispersync.GetLatestStringList(latestListKey)  
for i,entry in ipairs(latestList) do  
	print("-" entry.value)  
end  
local keys = gamecircle.Whispersync.GetLatestStringListKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  
``````