# appodeal.getVersion()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appodeal, getVersion
> __See also__          [appodeal.*][plugin.appodeal]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Function returns plugin version. The data returned is formatted as a `pluginVersion` - current Corona Appodeal plugin version and `sdkVersion` - current Appodeal SDK version in [event.data][plugin.appodeal.event.adsRequest.data].


## Syntax

	appodeal.getVersion()


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

-- Sometime later, after Appodeal will be fully initialized get plugin and SDK versions
appodeal.getVersion()
``````
