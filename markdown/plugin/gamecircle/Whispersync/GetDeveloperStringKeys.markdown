# gamecircle.Whispersync.GetDeveloperStringKeys

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      [KeyTable][plugin.gamecircle.Whispersync.KeyTable]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Whispersync, DeveloperString, Get  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Returns the keys for all DeveloperStrings stored under the current Whispersync GameData level. The return value is a [KeyTable][plugin.gamecircle.Whispersync.KeyTable].


## Syntax
	local keys = gamecircle.Whispersync.GetDeveloperStringKeys()
	
## Examples

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
