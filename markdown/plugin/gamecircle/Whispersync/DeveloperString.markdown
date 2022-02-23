# gamecircle.Whispersync.DeveloperString

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          whispersync, developerstring, string, merging  
> --------------------- ------------------------------------------------------------------------------------------

## Overview
The table returned from the [GetDeveloperString][plugin.gamecircle.Whispersync.GetDeveloperString] function. The table includes the local data as well as cloud data, and can tell you if the data is in conflict. A useful feature for when new data is downloaded by Whispersync from Amazon's cloud servers. 
	
## Properties
- __value__ - _[String][api.type.String]_  
	The value of the developer string that is stored locally.
- __timestamp__ - _[Number][api.type.Number]
	The timestamp of the locally saved developer string value, represented as the amount of time since January 1st, 1970
- __cloudValue__ - _[String][api.type.String]_  
	The value of the developer string that is stored in the cloud.
- __cloudTimestamp__ - _[Number][api.type.Number]
	The timestamp of the developer string value saved in the cloud, represented as the amount of time since January 1st, 1970 
- __inConflict__ - _[Boolean][api.type.Boolean]
	If the data is in conflict between the local copy and cloud copy, this boolean will be set to "true"
- __isSet__ - _[Boolean][api.type.Boolean]
	Boolean represents whether or not a value has been assigned to the DeveloperString yet. Changes to true after the first assignment. 
	
## Example
 
``````lua  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)   
local devString = gamecircle.Whispersync.GetDeveloperString("myFirstDevString")  
local newStringValue = devString.value .. "a"  
gamecircle.Whispersync.SetDeveloperString("myFirstDevString", newStringValue)  

print("These are all the Developer Strings I've generated under the current GameData set of Whispersync.")  
local keys = gamecircle.Whispersync.GetDeveloperStringKeys()  
for i,key in ipairs(keys) do  
	print("-" .. key)  
end  

function WhispersyncCallback(event)  
	if event == "NEW_DATA" then  
		local checkDevString = gamecircle.Whispersync.GetDeveloperString("myFirstDevString")  
		if checkDevString.inConflit then  
			print("The Developer String is in conflict! Using cloud data and marking as resolved")  
			gamecircle.Whispersync.SetDeveloperString("myFirstDevString", checkDevString.cloudValue)  
			gameCircle.Whispersync.MarkAsResolved("myFirstDevString")  
		end  
	end  
end  
gamecircle.Whispersync.SetWhispersyncEventListener(WhispersyncCallback) 
``````