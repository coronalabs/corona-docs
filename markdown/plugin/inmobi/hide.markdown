# inMobi.hide()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, InMobi, hide
> __See also__          [inMobi.show()][plugin.inmobi.show]
>						[inMobi.*][plugin.inmobi]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Hides a currently displayed InMobi banner ad. Does not apply to interstitial ads.


## Syntax

	inMobi.hide( placementID )

##### placementID ~^(required)^~
_[String][api.type.String]._ The placement ID for the currently displayed ad, retrieved from the [InMobi developer portal](https://www.inmobi.com/portal/).


## Example

``````lua
local inMobi = require( "plugin.inMobi" )

-- Pre-declare a placement ID
local placementID = "PLACEMENT_ID"

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load a banner ad
		inMobi.load( "banner", placementID )

	elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
		-- Show the ad
		inMobi.show( event.type, event.placementId, { yAlign="bottom" } )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.placementId )
		print( event.isError )
		print( event.response )
	end
end

-- Initialize the InMobi plugin
inMobi.init( adListener, { accountId="YOUR_ACCOUNT_ID" } )

-- Sometime later, hide the ad
inMobi.hide( placementID )
``````
