# flurryAnalytics.logEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Flurry Analytics, logEvent
> __See also__			[flurryAnalytics.startTimedEvent()][plugin.flurry-analytics.startTimedEvent]
>						[flurryAnalytics.*][plugin.flurry-analytics]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Use this function to record certain events which occur during a session of your application and pass dynamic parameters associated with the event. Event parameters can be passed as <nobr>key-value</nobr> pairs within a table.


## Syntax

	flurryAnalytics.logEvent( event [, params] )

##### event ~^(required)^~
_[String][api.type.String]._ The event to record.

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table containing optional values associated with the event.


## Example

``````lua
local flurryAnalytics = require( "plugin.flurry.analytics" )

local function flurryListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
	end
end

-- Initialize the Flurry plugin
flurryAnalytics.init( flurryListener, { apiKey="YOUR_API_KEY" } )

-- Log an event
flurryAnalytics.logEvent( "Menu selection", { location="Main Menu", selection="Multiplayer mode" } )
``````
