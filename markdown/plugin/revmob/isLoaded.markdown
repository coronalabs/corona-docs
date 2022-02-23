# revmob.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, RevMob, isLoaded
> __See also__          [revmob.show()][plugin.revmob.show]
>						[revmob.*][plugin.revmob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Checks to see if a RevMob ad is already loaded. Returns `true` if an ad is loaded/ready, otherwise returns `false`.


## Syntax

	revmob.isLoaded( placementId )

##### placementId ~^(required)^~
_[String][api.type.String]._ The placement ID of the ad that you want to check is loaded.


## Example

``````lua
local revmob = require( "plugin.revmob" )

local placementID = "PLACEMENT_ID"

local function adListener( event )

	if ( event.phase == "sessionStarted" ) then  -- Successful initialization
		-- Load a RevMob ad
		revmob.load( "banner", placementID )

	elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
		print( event.type )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.isError )
		print( event.response )
	end
end

-- Initialize RevMob
revmob.init( adListener, { appId="YOUR_APP_ID" } )

-- Sometime later, check if the ad is loaded
local isAdLoaded = revmob.isLoaded( placementID )
print( isAdLoaded )
``````
