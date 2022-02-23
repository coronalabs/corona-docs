# fbAudienceNetwork.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Facebook Audience Network, fbAudienceNetwork, load
> __See also__          [fbAudienceNetwork.show()][plugin.fbAudienceNetwork.show]
>						[fbAudienceNetwork.isLoaded()][plugin.fbAudienceNetwork.isLoaded]
>						[fbAudienceNetwork.*][plugin.fbAudienceNetwork]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Preloads a Facebook ad. You can also call [fbAudienceNetwork.isLoaded()][plugin.fbAudienceNetwork.isLoaded] to verify that the ad has been loaded and [fbAudienceNetwork.show()][plugin.fbAudienceNetwork.show] to show it.


## Syntax

	fbAudienceNetwork.load( adUnitType, params )

##### adUnitType ~^(required)^~
_[String][api.type.String]._ The type of ad according to your Facebook placement ID. Supported values are `"banner"`, `"rewardedVideo"` or `"interstitial"`.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing additional parameters for the specified ad type &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for the specified ad type.

##### placementId ~^(required)^~
_[String][api.type.String]._ The placement ID for this ad, retrieved from the [Facebook Developer Portal](https://developers.facebook.com/apps/).

##### bannerSize ~^(optional)^~
_[String][api.type.String]._ The banner ad size to load (does not apply to interstitial ads). Supported values include:

* `"BANNER_HEIGHT_50"`
* `"BANNER_HEIGHT_90"`
* `"BANNER_320_50"`
* `"RECTANGLE_HEIGHT_250"`


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
``````
