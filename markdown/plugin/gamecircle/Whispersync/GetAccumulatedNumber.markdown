# gamecircle.Whispersync.GetAccumulatedNumber

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [number][api.type.Number]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Accumulating, Number, Get, Whispersync
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the value for a AccumulatedNumber based on the key assigned to the value. 


## Syntax
	local value = gamecircle.Whispersync.GetAccumulatedNumber(key, NT_constant)
	
##### key ~^(required)^~
_[String][api.type.String]._ The key used to access a specific accumulated number.

##### NT_constant ~^(required)^~
_[String][api.type.String]._ The NT_constant, which is either "INT" or "DOUBLE", determins how the accumulated number will be processed inside the plugin and how it will be returned. "INT" will return an integer with no decimal value. "DOUBLE" will return the number with its decimal value intact. If the string given is invalid, "INT" will be used by default. 
	

## Examples

``````lua  
local gamecircle = require("plugin.gamecircle")   
gamecircle.Init(false, false, true)    
gamecircle.Whispersync.IncrementAccumulatingNumber("myFirstAccumNum", 25.255, "INT")  
gamecircle.Whispersync.DecrementAccumulatingNumber("myFirstAccumNum", 15.743, "INT")  
print("The value of the AccumNum should be 10. It is: " .. gamecircle.Whispersync.GetAccumulatedNumber("myFirstAccumNum", "INT"))  
--The value will be 10 because we used the NT_constant (NumberType) of "INT", meaning the decimal places were ignored for all the numbers. 
gamecircle.Whispersync.IncrementAccumulatingNumber("mySecondAccumNum", 25.255, "DOUBLE")  
gamecircle.Whispersync.DecrementAccumulatingNumber("mySecondAccumNum", 15.743, "DOUBLE")  
print("The integer value of the second AccumNum should be 9. It is: " .. gamecircle.Whispersync.GetAccumulatedNumber("mySecondAccumNum", "INT"))  
--The value stored with WhisperSync is actually 9.512, but because we used the "INT" NT_constant with the Get functions, we only got the 9 value.   
print("The double value of the second AccumNum should be 9.512. It is: " .. gamecircle.Whispersync.GetAccumulatedNumber("mySecondAccumNum", "DOUBLE"))  
--Using the NT_constant "DOUBLE", we are able to get the full decimal number stored with Whispersync.   
print("These are all the Accumulated Numbers I've generated under the current GameData set of Whispersync.")  
local keys = gamecircle.Whispersync.GetAccumulatingNumberKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  
``````
