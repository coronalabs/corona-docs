# gamecircle.Whispersync.SyncableStringList

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          whispersync, string, list
> --------------------- ------------------------------------------------------------------------------------------

## Overview
A lua table returned by the functions like [GetLatestStringList][plugin.gamecircle.Whispersync.GetLatestStringList].
	
## Properties
- __value__ - _[String][api.type.String]_  
	The string value of the 
- __maxSize__ - _[Number][api.type.Number]_  
	The maximum length of the list. Default value is 5.
- __isSet__ - _[Boolean][api.type.Boolean]_  
	Tells whether or not the list has been set and thus stored with Whispersync.
- __[]__ ___Square Bracket Accessor___ - _[SyncableStringElement][plugin.gamecircle.Whispersync.SyncableStringElement]_  
	The returned string-keys are stored as numerically-indexed entires on the table, ranging in value from 1 to "num". They can also be access using an ipairs interation.

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