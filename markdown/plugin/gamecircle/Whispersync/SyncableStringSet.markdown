# gamecircle.Whispersync.SyncableStringSet

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          whispersync, string, list
> --------------------- ------------------------------------------------------------------------------------------

## Overview
A lua table returned by the function [GetStringSet][plugin.gamecircle.Whispersync.GetStringSet].
	
## Properties
- __num__ - _[String][api.type.String]_  
	The number of [SyncableStringElement][plugin.gamecircle.Whispersync.SyncableStringElement] included in the StringSet 
- __isSet__ - _[Boolean][api.type.Boolean]_  
	Tells whether or not the list has been set and thus stored with Whispersync.
- __[]__ ___Square Bracket Accessor___ - _[SyncableStringElement][plugin.gamecircle.Whispersync.SyncableStringElement]_  
	The returned string-keys are stored as numerically-indexed entires on the table, ranging in value from 1 to "num". They can also be access using an ipairs interation.

## Example
 
``````lua  
local stringSetKey = "myFirstStringSet" 
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.AddToStringSet("A")
gamecircle.Whispersync.AddToStringSet("B")
gamecircle.Whispersync.AddToStringSet("C")
gamecircle.Whispersync.AddToStringSet("D")
gamecircle.Whispersync.AddToStringSet("E")
print("Does the set contain F?: " .. gamecircle.Whispersync.StringSetContains(stringSetKey, "F"))
print("Here is what the string set does contain:")
local stringSet = gamecircle.Whispersync.GetStringSet(stringSetKey)  
for i,entry in ipairs(stringSet) do  
	print("-" entry.value)  
end  
print("The extra for element A is:")
local entryA = gamecircle.Whispersync.GetStringSetValue("A")
print("-value: " .. entryA.value)
print("-isSet: " .. entryA.isSet)
print("-metadataPresent: " .. entryA.metadataPresent)
print("-timestamp: " .. entryA.timestamp)
local keys = gamecircle.Whispersync.GetHighNumberListKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  
``````