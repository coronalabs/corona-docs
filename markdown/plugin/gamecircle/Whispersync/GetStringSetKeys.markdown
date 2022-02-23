# gamecircle.Whispersync.GetStringSetKeys

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [KeyTable][plugin.gamecircle.Whispersync.KeyTable]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Highest, SyncableNumber, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the keys for the string sets stored under the current Whispersync GameData level. The return value is a [KeyTable][plugin.gamecircle.Whispersync.KeyTable].


## Syntax
	local keys = gamecircle.Whispersync.GetStringSetKeys()
	
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
