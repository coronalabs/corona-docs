# gamecircle.Whispersync.StringSetContains

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [Boolean][api.type.Boolean]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Whispersync, DeveloperString, MarkAsResolved  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns true if the string given to it exists in the string set specified by key, otherwise it returns false.

## Syntax
	gamecircle.Whispersync.StringSetContains(key, value)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific string set.
##### value ~^(required)^~
_[String][api.type.String]._ The value being checked to see if it exists in the set.


## Examples

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
