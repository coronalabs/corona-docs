# appnext.getRewardsRewardTypeCurrency()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, getRewardsRewardTypeCurrency
> __See also__          [appnext.setRewardsRewardTypeCurrency()][plugin.appnext.setRewardsRewardTypeCurrency]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Relevant for rewarded ads only. Gets the previously set type of reward (life/credit/points) for the ad.


## Syntax

	appnext.getRewardsRewardTypeCurrency( adKey )

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

appnext.setRewardsRewardTypeCurrency( rewardedAdKey, "YOUR_REWARDS_REWARD_TYPE_CURRENCY" )

print( "Reward Type Currency: " .. appnext.getRewardsRewardTypeCurrency( rewardedAdKey ) )
``````
