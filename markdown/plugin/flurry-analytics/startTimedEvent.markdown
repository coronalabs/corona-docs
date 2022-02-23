# flurryAnalytics.startTimedEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Flurry Analytics, startTimedEvent
> __See also__			[flurryAnalytics.endTimedEvent()][plugin.flurry-analytics.endTimedEvent]
>						[flurryAnalytics.logEvent()][plugin.flurry-analytics.logEvent]
>						[flurryAnalytics.*][plugin.flurry-analytics]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Use this function to start a timed event. This can be useful to determine how long a user stays within a certain section of your app, for example a game level. Additional event parameters can be passed as <nobr>key-value</nobr> pairs within a table.

Timed events can be ended via the [flurryAnalytics.endTimedEvent()][plugin.flurry-analytics.endTimedEvent] function.


## Syntax

	flurryAnalytics.startTimedEvent( event [, params] )

##### event ~^(required)^~
_[String][api.type.String]._ The timed event to start.

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
``````
