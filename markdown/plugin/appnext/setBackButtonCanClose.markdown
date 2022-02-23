# appnext.setBackButtonCanClose()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, setBackButtonCanClose
> __See also__          [appnext.getBackButtonCanClose()][plugin.appnext.getBackButtonCanClose]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Android only; sets whether the "Back" key can close the ad <nobr>(`false` by default)</nobr>.


## Syntax

	appnext.setBackButtonCanClose( adKey, backButtonCanClose )

##### adKey ~^(required)^~
_[String][api.type.String]._ The ad key returned for a previously created ad.

##### backButtonCanClose ~^(required)^~
_[Boolean][api.type.Boolean]._ Indicates whether the "Back" key can close the ad.


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

appnext.setBackButtonCanClose( interstitialAdKey, true )
``````
