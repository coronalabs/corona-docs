# appnext.setPostback()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, setPostback
> __See also__          [appnext.getPostback()][plugin.appnext.getPostback]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets postback parameters that will be posted to your server after user installs an app. Make sure to encode the values.


## Syntax

	appnext.setPostback( adKey, postback )

##### adKey ~^(required)^~
_[String][api.type.String]._ The ad key returned for a previously created ad.

##### postback ~^(required)^~
_[String][api.type.String]._ The postback parameters to be set for the ad.


## Example

``````lua
local appnext = require( "plugin.appnext" )

local function adListener( event )
	print( "Received " .. event.event .. " for " .. event.adKey .. " with message: " .. event.message )
end

-- Initialize the Appnext plugin
appnext.init( adListener )

-- Create your ads
local interstitialPlacementID

local platform = system.getInfo( "platformName" )
if ( platform == "iPhone OS" ) then
    interstitialPlacementID = "YOUR_IOS_INTERSTITIAL_PLACEMENT_ID"
elseif ( platform == "Android" ) then
    interstitialPlacementID = "YOUR_ANDROID_INTERSTITIAL_PLACEMENT_ID"
end

local interstitialAdKey = appnext.createAd( "interstitial", interstitialPlacementID )

appnext.setPostback( interstitialAdKey, "YOUR_POSTBACK_PARAMS_HERE" )
``````
