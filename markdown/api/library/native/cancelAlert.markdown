
# native.cancelAlert()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          alerts, display objects, native objects
> __See also__          [native.showAlert()][api.library.native.showAlert]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Dismisses an alert box programmatically. For example, you may wish to have a popup alert that automatically disappears after ten seconds even if the user doesn't click it. In that case, you could call this function at the end of a timer.

## Syntax

	native.cancelAlert( alert )

##### alert ~^(required)^~
_[Table][api.type.Table]._ The alert to cancel, returned from [native.showAlert()][api.library.native.showAlert].


## Examples

##### Standard

`````lua
local function onComplete( event )
	if event.action == "clicked" then
		local i = event.index
		if i == 1 then
			-- Do nothing; dialog will simply dismiss
		elseif i == 2 then
			-- Open URL if "Learn More" (the 2nd button) was clicked
			system.openURL( "https://solar2d.com/" )
		end
	end
end
 
-- Show alert with two buttons
local alert = native.showAlert( "Solar2D", "Dream. Build. Ship.", { "OK", "Learn More" }, onComplete )
 
-- Dismisses "alert" after 10 seconds if user has not responded
local function cancelMyAlert()
	native.cancelAlert( alert )
end
 
timer.performWithDelay( 10000, cancelMyAlert )
`````

##### Cancel and Show New Alert

`````lua
-- Handler that gets notified when the alert closes
local function onComplete( event )
   if event.action == "clicked" then
		local i = event.index
		if i == 1 then
			-- Do nothing; dialog will simply dismiss
		elseif i == 2 then
			-- Open URL if "Learn More" (second button) was clicked
			system.openURL( "https://solar2d.com/" )
		end
	end
end

local alert

if ( alert ~= nil ) then
	native.cancelAlert( alert )
	alert = nil
end

local function showAlert()
	alert = native.showAlert( "Solar2D", "Dream. Build. Ship.", { "OK", "Learn More" }, onComplete )
end

timer.performWithDelay( 10, showAlert )
``````