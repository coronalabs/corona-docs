# gamecircle.Whispersync.SyncableNumberList

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          whispersync, number, list
> --------------------- ------------------------------------------------------------------------------------------

## Overview
A lua table returned by the functions like [GetHighNumberList][plugin.gamecircle.Whispersync.GetHighNumberList].
	
## Properties
- __size__ - _[Number][api.type.Number]_  
	The number values in the array.
- __maxSize__ - _[Number][api.type.Number]_  
	The maximum length of the list. Default value is 5.
- __isSet__ - _[Boolean][api.type.Boolean]_  
	Tells whether or not the list has been set and thus stored with Whispersync.
- __[]__ ___Square Bracket Accessor___ - _[SyncableNumberElement][plugin.gamecircle.Whispersync.SyncableNumberElement]_  
	The returned string-keys are stored as numerically-indexed entires on the table, ranging in value from 1 to "num". They can also be access using an ipairs interation.

## Example
 
``````lua  
local highListKey = "myFirstHighNumberList" 
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
gamecircle.Whispersync.SetHighNumberListLength(highListKey, 4)  
gamecircle.Whispersync.AddToHighNumberList(highListKey, 10, "INT")  
gamecircle.Whispersync.AddToHighNumberList(highListKey, 1000, "INT")  
gamecircle.Whispersync.AddToHighNumberList(highListKey, 1, "INT")  
gamecircle.Whispersync.AddToHighNumberList(highListKey, 10000, "INT")   
gamecircle.Whispersync.AddToHighNumberList(highListKey, 100, "INT")  
print("Here is the list of numbers as they are stored in the high number list. They should be in the order from highest to lowest.")  
local highList = gamecircle.Whispersync.GetHighNumberList(highListKey)  
for i,entry in ipairs(highList) do  
	print("-" entry.value)  
end  
local keys = gamecircle.Whispersync.GetHighNumberListKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  
``````