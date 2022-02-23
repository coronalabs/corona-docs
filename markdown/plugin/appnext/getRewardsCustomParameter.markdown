# appnext.getRewardsCustomParameter()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, getRewardsCustomParameter
> __See also__          [appnext.setRewardsCustomParameter()][plugin.appnext.setRewardsCustomParameter]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Relevant for rewarded ads only. Gets the previously set custom parameter value/data for the ad.


## Syntax

	appnext.getRewardsCustomParameter( adKey )

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
local rewardedPlacementID

local platform = system.getInfo( "platformName" )
if ( platform == "iPhone OS" ) then
    rewardedPlacementID = "YOUR_IOS_REWARDED_PLACEMENT_ID"
elseif ( platform == "Android" ) then
    rewardedPlacementID = "YOUR_ANDROID_REWARDED_PLACEMENT_ID"
end

local rewardedAdKey = appnext.createAd( "rewarded", rewardedPlacementID )

appnext.setRewardsCustomParameter( rewardedAdKey, "YOUR_REWARDS_CUSTOM_PARAMETER" )

print( "Custom parameter: " .. appnext.getRewardsCustomParameter( rewardedAdKey ) )
``````
