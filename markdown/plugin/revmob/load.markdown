# revmob.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, RevMob, load
> __See also__          [revmob.show()][plugin.revmob.show]
>						[revmob.isLoaded()][plugin.revmob.isLoaded]
>						[revmob.*][plugin.revmob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Preloads a RevMob ad. You can also call [revmob.isLoaded()][plugin.revmob.isLoaded] to verify that the ad has been loaded and [revmob.show()][plugin.revmob.show] to show it.


## Syntax

	revmob.load( adUnitType, placementId )

##### adUnitType ~^(required)^~
_[String][api.type.String]._ The type of ad to display. Valid values are `"banner"`, `"interstitial"`, `"video"`, or `"rewardedVideo"`.

##### placementId ~^(required)^~
_[String][api.type.String]._ The placement ID of the ad you want to load.


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
``````
