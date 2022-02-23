# appnext.showAd()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, showAd
> __See also__          [appnext.createAd()][plugin.appnext.createAd]
>						[appnext.adIsLoaded()][plugin.appnext.adIsLoaded]
>						[appnext.loadAd()][plugin.appnext.loadAd]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function is used to show an ad previously created with [appnext.createAd()][plugin.appnext.createAd] and, in the case of <nobr>full-screen</nobr> and rewarded ads, loaded with [appnext.loadAd()][plugin.appnext.loadAd].


## Syntax

	appnext.showAd( adKey )

##### adKey ~^(required)^~
_[String][api.type.String]._ The ad key returned for a previously created ad.


## Example

``````lua
local appnext = require( "plugin.appnext" )

local function adListener( event )
	print( "Received " .. event.event .. " for " .. event.adKey .. " with message: " .. event.message )
end

-- Initialize the Appnext plugin
appnext.init( adListener )

-- Create your ads
local fullscreenPlacementID
local rewardedPlacementID

local platform = system.getInfo( "platformName" )
if ( platform == "iPhone OS" ) then
	fullscreenPlacementID = "YOUR_IOS_FULLSCREEN_PLACEMENT_ID"
	rewardedPlacementID = "YOUR_IOS_REWARDED_PLACEMENT_ID"
elseif ( platform == "Android" ) then
	fullscreenPlacementID = "YOUR_ANDROID_FULLSCREEN_PLACEMENT_ID"
	rewardedPlacementID = "YOUR_ANDROID_REWARDED_PLACEMENT_ID"
end

local fullscreenAdKey = appnext.createAd( "fullscreen", fullscreenPlacementID )
local rewardedAdKey = appnext.createAd( "rewarded", rewardedPlacementID )

-- Load your ads before showing
appnext.loadAd( fullscreenAdKey )
appnext.loadAd( rewardedAdKey )

-- Show full-screen video ad
if ( appnext.adIsLoaded( fullscreenAdKey ) ) then
	appnext.showAd( fullscreenAdKey )
end
``````
