# appodeal.getRewardParameters()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appodeal, getRewardParameters
> __See also__          [appodeal.*][plugin.appodeal]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the reward parameters for the specified placement&nbsp;ID with an [event.phase][plugin.appodeal.event.adsRequest.phase] of `"dataReceived"`. The data returned is formatted as a JSON string in [event.data][plugin.appodeal.event.adsRequest.data].


## Syntax

	appodeal.getRewardParameters( [placementId] )

##### placementId ~^(optional)^~
_[String][api.type.String]._ The placement ID for which to return reward parameters. If no placement&nbsp;ID is given, the default placement will be used.


## Example

``````lua
local appodeal = require( "plugin.appodeal" )

local function adListener( event )

	if ( event.phase == "init" ) then  
    -- Successful initialization

  elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.isError )
		print( event.response )

  elseif ( event.phase == "dataReceived" ) then  -- Event data received
		print( event.type )
		print( event.data )
	end
end

-- Initialize the Appodeal plugin
appodeal.init( adListener, { appKey="YOUR_APP_KEY" } )

-- Sometime later, get the reward parameters for the default placement
appodeal.getRewardParameters()
``````
