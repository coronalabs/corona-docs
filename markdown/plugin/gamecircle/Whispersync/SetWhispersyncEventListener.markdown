# gamecircle.Whispersync.SetWhispersyncEventListener()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Leaderboard, Overlay  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Will register a callback with the Whispersync systems to update the lua application with important events. 


## Syntax
	gamecircle.Whispersync.SetWhispersyncEventListener( callback )

##### callback ~^(required)^~
_[Function][api.type.Function]._ The callback function for events propegated by Whispersync.

## Information on Callback Function
Your callback function should have a single, string parameter. This parameter will be populated with one of five values that are associated with Whispersync's internal enumeration. The five values you can recieve are:  
- __"NEW\_DATA"__  
	This callback event occurs if new data has been fetched from Amazon's cloud servers. When you recieve this, it is usually wise to check any DeveloperStrings you may be using to ensure they aren't in conflict.  
- __"UPLOAD\_COMPLETE"__  
	This callback event occurs when Whispersync finishes sending data to Amazon's cloud servers.  
- __"THROTTLED"__  
	This callback occurs when Whispersync's reading/writing/posting/downloading of data is being slowed. It is usually just a warning message that processes may take longer to complete.  
- __"DISK\_WRITE\_COMPLETE"__  
	This callback event occurs when WHispersync finishes writing data to the local disk.
- __"FIRST\_SYNC"__  
	This callback occurs the first time an app launches and the first time the connected Whispersync systems download data from Amazon's cloud servers.  

## Examples

``````lua  
local gamecircle = require("plugin.gamecircle")    
gamecircle.Init(false, false, true)  
function WhispersyncCallback(event)  
	if event == "NEW_DATA" then  
		print("Whispersync systems have gotten new data")  
	elseif event == "UPLOAD_COMPLETE"  
		print("Whispersync has finished uploading")  
	elseif event == "THROTTLED"  
		print("Whispersync has been throttled")  
	elseif event == "DISK_WRITE_COMPLETE"  
		print("Whispersync has finished writing data to the local disk")  
	elseif event == "FIRST_SYNC"  
		print("Whispersync has completed it's first sync")  
	end  
end  
gamecircle.Whispersync.SetWhispersyncEventListener(Whispersy ncCallback)  
``````
