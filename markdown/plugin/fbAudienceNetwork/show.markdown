# fbAudienceNetwork.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Facebook Audience Network, fbAudienceNetwork, show
> __See also__          [fbAudienceNetwork.hide()][plugin.fbAudienceNetwork.hide]
>						[fbAudienceNetwork.init()][plugin.fbAudienceNetwork.init]
>						[fbAudienceNetwork.load()][plugin.fbAudienceNetwork.load]
>						[fbAudienceNetwork.isLoaded()][plugin.fbAudienceNetwork.isLoaded]
>						[fbAudienceNetwork.*][plugin.fbAudienceNetwork]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a Facebook ad which was previously loaded via [fbAudienceNetwork.load()][plugin.fbAudienceNetwork.load].


## Syntax

	fbAudienceNetwork.show( adUnitType, params )

##### adUnitType ~^(required)^~
_[String][api.type.String]._ The type of ad according to your Facebook placement ID. Supported values are `"banner"`, `"rewardedVideo"` or `"interstitial"`.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing additional parameters for the specified ad type &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for the specified ad type.

##### placementId ~^(required)^~
_[String][api.type.String]._ The placement ID for this ad, retrieved from the [Facebook Developer Portal](https://developers.facebook.com/apps/).

##### y ~^(optional)^~
_[String][api.type.String] or [Number][api.type.Number]._ Only applies to banner ads, specifying the banner's __y__ position on the screen. If you supply a [string][api.type.String], valid position values are `"top"`, `"center"` and `"bottom"`. Alternatively, you can set a custom __y__ position by specifying a [number][api.type.Number] in content coodinates where `0` indicates the top edge of the screen or where a negative value specifies an offset from the bottom edge of the screen to the bottom edge of the banner. Default is `"bottom"`.


## Example

``````lua
local fbAudienceNetwork = require( "plugin.fbAudienceNetwork" )

-- Pre-declare a placement ID
local myPlacementID = "YOUR_PLACEMENT_ID"

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load a banner ad
		fbAudienceNetwork.load( "banner", { placementId=myPlacementID, bannerSize="BANNER_320_50" } )

	elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
		print( event.type )
		print( event.placementId )
	end
end

-- Initialize the Facebook Audience Network
fbAudienceNetwork.init( adListener )

-- Sometime later, check if the ad is loaded and display it
if ( fbAudienceNetwork.isLoaded( myPlacementID ) ) then
	fbAudienceNetwork.show( "banner", { placementId=myPlacementID, y="center" } )
end
``````
