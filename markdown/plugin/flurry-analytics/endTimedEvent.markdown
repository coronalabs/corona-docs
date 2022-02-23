# flurryAnalytics.endTimedEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Flurry Analytics, endTimedEvent
> __See also__			[flurryAnalytics.startTimedEvent()][plugin.flurry-analytics.startTimedEvent]
>						[flurryAnalytics.*][plugin.flurry-analytics]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Use this function to explicitly end a timed event which was started with [flurryAnalytics.startTimedEvent()][plugin.flurry-analytics.startTimedEvent]. Additional event parameters can be passed as <nobr>key-value</nobr> pairs within a table.

Note that all timed events end automatically when the app exits.


## Syntax

	flurryAnalytics.endTimedEvent( event [, params] )

##### event ~^(required)^~
_[String][api.type.String]._ The timed event to end.

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

-- Start a timed event
flurryAnalytics.startTimedEvent( "Level 1", { skill="Beginner" } )

-- Sometime later, end the timed event
flurryAnalytics.endTimedEvent( "Level 1", { skill="Beginner" } )
``````
