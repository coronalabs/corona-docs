# fbAudienceNetwork.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Facebook Audience Network, fbAudienceNetwork, isLoaded
> __See also__          [fbAudienceNetwork.show()][plugin.fbAudienceNetwork.show]
>						[fbAudienceNetwork.*][plugin.fbAudienceNetwork]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Checks to see if a Facebook ad is already loaded. Returns `true` if an ad is loaded/ready, otherwise returns `false`.


## Syntax

	fbAudienceNetwork.isLoaded( placementID )

##### placementID ~^(required)^~
_[String][api.type.String]._ The placement ID for the ad, retrieved from the [Facebook Developer Portal](https://developers.facebook.com/apps/).


## Example

``````lua
local fbAudienceNetwork = require( "plugin.fbAudienceNetwork" )

-- Pre-declare a placement ID
local myPlacementID = "YOUR_PLACEMENT_ID"

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load a banner ad
		fbAudienceNetwork.load( "banner", { placementId=myPlacementID, bannerSize="BANNER_HEIGHT_50" } )

	elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
		print( event.type )
		print( event.placementId )		
	end
end

-- Initialize the Facebook Audience Network
fbAudienceNetwork.init( adListener )

-- Sometime later, check if the ad is loaded and display it
if ( fbAudienceNetwork.isLoaded( myPlacementID ) ) then
	fbAudienceNetwork.show( "banner", { placementId=myPlacementID } )
end
``````
