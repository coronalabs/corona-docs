# batteryState.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          battery, batteryState, init
> __See also__          [batteryState.*][plugin.batteryState]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initializes the plugin and optionally defines a listener function for battery events.


## Syntax

	batteryState.init( [listener] )

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ The listener function invoked when the battery state/level changes. This function will receive [batteryStateEvent][plugin.batteryState.event.batteryStateEvent] events.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

If you simply want battery state results as a <nobr>one-time</nobr> call, you can use the [batteryState.getState()][plugin.batteryState.getState] method instead of providing a listener function reference and waiting for a state/level change response.

</div>


## Example

``````lua
local batteryState = require( "plugin.batteryState" )
local json = require( "json" )

local function batteryListener( event )
	print( "Battery State event:" )
	print( json.prettify(event) )
end

-- Initialize plugin with state listener
batteryState.init( batteryListener )
``````
