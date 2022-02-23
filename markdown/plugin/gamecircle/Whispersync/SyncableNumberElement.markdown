# gamecircle.Whispersync.SyncableNumberElement

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          whispersync, number, list, element
> --------------------- ------------------------------------------------------------------------------------------

## Overview
A single element in a [SyncableNumberList][plugin.gamecircle.Whispersync.SyncableNumberList].
	
## Properties
- __value__ - _[Number][api.type.Number]_  
	The number value associated with the SyncableNumberElement
- __metadataPresent__ - _[Boolean][api.type.Boolean]_  
	If true, there is metadata that was submitted with this number
- __metadata__ - _[Metadata][plugin.gamecircle.Whispersync.metadata]_  
	The metadata of the object if it was included in the "Set" function.
- __timestamp__ - _[Number][api.type.Number]_  
	The timestamp of when the value was added to the list. It is the time passed since January 1st, 1970.
	
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