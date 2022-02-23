# gamecircle.Whispersync.GetStringSetValue

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [SyncableStringElement][plugin.gamecircle.Whispersync.SyncableStringElement]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Highest, SyncableNumber, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the requested string from the set as a [SyncableStringElement][plugin.gamecircle.Whispersync.SyncableStringElement]. If the string doesn't exist in the set, then the isSet variable of the returned table will be set to "false". Another way to check is the [StringSetContains][plugin.gamecircle.Whispersync.StringSetContains] function.


## Syntax
	local stringSetElement = gamecircle.Whispersync.GetStringSetValue(key, value)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific string set.

##### value ~^(required)^~
_[String][api.type.String]._ The value to be fetched from the specific string set.

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