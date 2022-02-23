# flurryAnalytics.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Flurry Analytics, init
> __See also__			[flurryAnalytics.*][plugin.flurry-analytics]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function initializes the Flurry plugin and it must be executed before making other Flurry calls such as [flurryAnalytics.logEvent()][plugin.flurry-analytics.logEvent].

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

You must wait for the `"init"` [phase][plugin.flurry-analytics.event.analyticsRequest.phase] event before trying to log analytics events ([flurryAnalytics.logEvent()][plugin.flurry-analytics.logEvent]) or start timed events ([flurryAnalytics.startTimedEvent()][plugin.flurry-analytics.startTimedEvent]).

</div>


## Syntax

	flurryAnalytics.init( listener, params )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener that will receive [analyticsRequest][plugin.flurry-analytics.event.analyticsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing Flurry initialization values — see the next section for details.


## Parameter Reference

The `params` table includes parameters for the Flurry initialization.

##### apiKey ~^(required)^~
_[String][api.type.String]._ Your Flurry API key, gathered from the [Flurry](https://dev.flurry.com/) system.

##### crashReportingEnabled ~^(optional)^~
_[Boolean][api.type.Boolean]._ Set to `true` to enable crash analytics. This will enable your app to send crash data and unhandled errors to Flurry. Default is `false`.

##### logLevel ~^(optional)^~
_[String][api.type.String]._ Sets the logging level. Default is minimal logging with critical messages only. Possible values include `"default"`, `"debug"`, or `"all"`. 


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
``````
