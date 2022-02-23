# appnext.setAutoPlay()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, setAutoPlay
> __See also__          [appnext.getAutoPlay()][plugin.appnext.getAutoPlay]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Effects interstitial ads only. Sets the video to <nobr>auto-play</nobr> <nobr>(`true` by default)</nobr>.


## Syntax

	appnext.setAutoPlay( adKey, autoPlay )

##### adKey ~^(required)^~
_[String][api.type.String]._ The ad key returned for a previously created ad.

##### autoPlay ~^(required)^~
_[Boolean][api.type.Boolean]._ Indicates whether the interstitial with video will <nobr>auto-play</nobr>.


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

appnext.setAutoPlay( interstitialAdKey, false )
``````
