# apsalar.endSession()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Apsalar, endSession
> __See also__			[apsalar.init()][plugin.apsalar.init]
>						[apsalar.*][plugin.apsalar]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Used to end an Apsalar session upon application exit.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

You must call this method on every application exit event to ensure proper reporting. See the example below for details on how to monitor [system][api.event.system] events, in particular `"applicationExit"`.

</div>


## Syntax

	apsalar.endSession()


## Example

``````lua
local apsalar = require( "plugin.apsalar" )

-- Initialize the Apsalar plugin
apsalar.init( "YOUR_API_KEY", "YOUR_SECRET_KEY" )

-- System event listener function
local function onSystemEvent( event )

	if ( event.type == "applicationExit" ) then
		-- End the Apsalar session
		apsalar.endSession()
	end
end

-- Add the system event listener
Runtime:addEventListener( "system", onSystemEvent )
``````
