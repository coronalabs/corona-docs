# inMobi.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, InMobi, isLoaded
> __See also__          [inMobi.show()][plugin.inmobi.show]
>						[inMobi.load()][plugin.inmobi.load]
>						[inMobi.*][plugin.inmobi]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Checks whether an ad is already loaded. Returns `true` if an ad is loaded/ready, otherwise returns `false`.


## Syntax

	inMobi.isLoaded( placementID )

##### placementID ~^(required)^~
_[String][api.type.String]._ The placement ID for the ad, retrieved from the [InMobi developer portal](https://www.inmobi.com/portal/). This is a numeric string and is listed in the [InMobi developer portal](https://www.inmobi.com/portal/) under the label __Placement&nbsp;ID__.


## Example

``````lua
local inMobi = require( "plugin.inMobi" )

-- Pre-declare a placement ID
local placementID = "PLACEMENT_ID"

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load a banner ad
		inMobi.load( "banner", placementID )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.placementId )
		print( event.isError )
		print( event.response )
	end
end

-- Initialize the InMobi plugin
inMobi.init( adListener, { accountId="YOUR_ACCOUNT_ID" } )

-- Sometime later, check if the ad is loaded
local isAdLoaded = inMobi.isLoaded( placementID )
print( isAdLoaded )
``````
