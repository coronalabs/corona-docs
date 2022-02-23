# appnext.adIsLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, adIsLoaded
> __See also__          [appnext.createAd()][plugin.appnext.createAd]
>						[appnext.loadAd()][plugin.appnext.loadAd]
>						[appnext.showAd()][plugin.appnext.showAd]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function is used to check if an ad previously created with [appnext.createAd()][plugin.appnext.createAd] and loaded with [appnext.loadAd()][plugin.appnext.loadAd] is already loaded.


## Syntax

	appnext.adIsLoaded( adKey )

##### adKey ~^(required)^~
_[String][api.type.String]._ The ad key previously received from [appnext.createAd()][plugin.appnext.createAd].


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
local fullscreenPlacementID
local rewardedPlacementID

local platform = system.getInfo( "platformName" )
if ( platform == "iPhone OS" ) then
	interstitialPlacementID = "YOUR_IOS_INTERSTITIAL_PLACEMENT_ID"
	fullscreenPlacementID = "YOUR_IOS_FULLSCREEN_PLACEMENT_ID"
	rewardedPlacementID = "YOUR_IOS_REWARDED_PLACEMENT_ID"
elseif ( platform == "Android" ) then
	interstitialPlacementID = "YOUR_ANDROID_INTERSTITIAL_PLACEMENT_ID"
	fullscreenPlacementID = "YOUR_ANDROID_FULLSCREEN_PLACEMENT_ID"
	rewardedPlacementID = "YOUR_ANDROID_REWARDED_PLACEMENT_ID"
end

local interstitialAdKey = appnext.createAd( "interstitial", interstitialPlacementID )
local fullscreenAdKey = appnext.createAd( "fullscreen", fullscreenPlacementID )
local rewardedAdKey = appnext.createAd( "rewarded", rewardedPlacementID )

-- Load your ad before showing
appnext.loadAd( interstitialAdKey )

-- Sometime later, when you want to show the interstitial ad
if ( appnext.adIsLoaded( interstitialAdKey ) ) then
	appnext.showAd( interstitialAdKey )
end
``````
