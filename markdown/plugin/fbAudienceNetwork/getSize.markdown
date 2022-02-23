# fbAudienceNetwork.getSize()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Facebook Audience Network, fbAudienceNetwork, getSize
> __See also__          [fbAudienceNetwork.show()][plugin.fbAudienceNetwork.show]
>						[fbAudienceNetwork.*][plugin.fbAudienceNetwork]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the width and height of a banner ad loaded via [fbAudienceNetwork.load()][plugin.fbAudienceNetwork.load]. Does not apply to interstitial ads.


## Syntax

	fbAudienceNetwork.getSize( placementID )

##### placementID ~^(required)^~
_[String][api.type.String]._ The placement ID for the currently loaded ad, retrieved from the [Facebook Developer Portal](https://developers.facebook.com/apps/).


## Example

``````lua
local fbAudienceNetwork = require( "plugin.fbAudienceNetwork" )

-- Pre-declare a placement ID
local myPlacementID = "YOUR_BANNER_PLACEMENT_ID"

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

-- Sometime later, get the banner ad width and height
local bWidth, bHeight = fbAudienceNetwork.getSize( myPlacementID )
print( bWidth, bHeight )
``````
