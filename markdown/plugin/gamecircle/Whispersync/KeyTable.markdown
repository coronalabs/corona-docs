# gamecircle.Whispersync.KeyTable

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          achievement  
> --------------------- ------------------------------------------------------------------------------------------

## Overview
A lua table that holds the keys for a certani type of Whispersync data under the current GameData set. It is returned from functions like [GetHighestNumberKeys][plugin.gamecircle.Whispersync.GetHighestNumberKeys].
	
## Properties
- __num__ - _[Number][api.type.Number]_  
	The number of keys returned with the request.
- __[]__ ___Square Bracket Accessor___ - _[String][api.type.String]_  
	The returned string-keys are stored as numerically-indexed entires on the table, ranging in value from 1 to "num". They can also be access using an ipairs interation.


## Example
 
``````lua  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
print("This is a set of keys stored under the current GameData")
local keys = gamecircle.Whispersync.GetLowestNumberKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end 
``````