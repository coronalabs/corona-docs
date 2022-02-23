# gamecircle.Whispersync.GetAccumulatingNumberKeys

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [KeyTable][plugin.gamecircle.Whispersync.KeyTable]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Accumulating, Number, Whispersync, Keys
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the keys for all AccumulatingNumbers stored under the current Whispersync GameData level. The return value is a [KeyTable][plugin.gamecircle.Whispersync.KeyTable].


## Syntax
	local keys = gamecircle.Whispersync.GetAccumulatingNumberKeys()
	
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
