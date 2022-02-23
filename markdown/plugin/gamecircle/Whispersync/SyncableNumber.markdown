# gamecircle.Whispersync.SyncableNumber

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          whispersync, number
> --------------------- ------------------------------------------------------------------------------------------

## Overview
A lua table returned by the functions like [GetHighestNumber][plugin.gamecircle.Whispersync.GetHighestNumber].
	
## Properties
- __value__ - _[Number][api.type.Number]_  
	The value of the number associated with the table. 
- __timestamp__ - _[Number][api.type.Number]_  
	The timestamp of the locally saved developer string value, represented as the amount of time since January 1st, 1970
- __metadataPresent__ - _[Boolean][api.type.Boolean]_  
	If true, there is metadata that was submitted with this number
- __metadata__ - _[Metadata][plugin.gamecircle.Whispersync.metadata]_  
	The metadata of the object if it was included in the "Set" function.
- __isSet__ - _[Boolean][api.type.Boolean]_  
	Boolean represents whether or not a value has been assigned yet. Changes to true after the first assignment. 
	
## Example
 
``````lua  
local highNumKey = "myFirstHighNumber" 
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.SetHighestNumber(highNumKey, 10, "INT")  
gamecircle.Whispersync.SetHighestNumber(highNumKey, 1000, "INT")  
gamecircle.Whispersync.SetHighestNumber(highNumKey, 1, "INT")  
gamecircle.Whispersync.SetHighestNumber(highNumKey, 10000, "INT")  
gamecircle.Whispersync.SetHighestNumber(highNumKey, 100, "INT")  
print("The Highest Number is: " .. gamecircle.Whispersync.GetHighestNumber(highNumKey, "INT").value)  
print("These are all the Highest Number values stored under the current GameData set of Whispersync.")  
local keys = gamecircle.Whispersync.GetHighestNumberKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  
``````