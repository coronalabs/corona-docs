# gamecircle.Whispersync.SetLowestNumber

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Lowest, SyncableNumber, Whispersync  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Set a value to the lowest number associated with the key. Only the lowest value ever assigned will be stored. 


## Syntax
	gamecircle.Whispersync.SetLowestNumber(key, value, NT_constant)
	gamecircle.Whispersync.SetLowestNumber(key, value, NT_constant, metadata)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific lowest number.

##### value ~^(require)^~
_[Number][api.type.Number]._ The value to be assigned to the lowest number.

##### NT_constant ~^(required)^~
_[String][api.type.String]._ The NT_constant, which is either "INT" or "DOUBLE", determins how the lowest number will be stored. "INT" cutt off the decimal value. "DOUBLE" maintain the decimal value intact. If the string given is invalid, "INT" will be used by default.

##### metadata ~^(optional)^~
_[Metadata][plugin.gamecircle.Whispersync.Metadata]._ A table of metadata to be stored with the number. It must be a lua table comprised only of string fields with string values in those fields. For examples and more information, check the documentation page for metadata. 

## Examples

``````lua  
local lowNumKey = "myFirstLowNumber" 
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.SetLowestNumber(lowNumKey, 10, "INT")  
gamecircle.Whispersync.SetLowestNumber(lowNumKey, 1000, "INT")  
gamecircle.Whispersync.SetLowestNumber(lowNumKey, 1, "INT")  
gamecircle.Whispersync.SetLowestNumber(lowNumKey, 10000, "INT")  
gamecircle.Whispersync.SetLowestNumber(lowNumKey, 100, "INT")  
print("The Lowest Number is: " .. gamecircle.Whispersync.GetLowestNumber(lowNumKey, "INT").value)  
print("These are all the Lowest Number values stored under the current GameData set of Whispersync.")  
local keys = gamecircle.Whispersync.GetLowestNumberKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  
``````