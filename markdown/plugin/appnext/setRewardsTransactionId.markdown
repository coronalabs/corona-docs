# appnext.setRewardsTransactionId()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, setRewardsTransactionId
> __See also__          [appnext.getRewardsTransactionId()][plugin.appnext.getRewardsTransactionId]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Effects rewarded ads only. Sets a transaction&nbsp;ID per ad view. Make sure this is a __unique__ rewards&nbsp;ID.


## Syntax

	appnext.setRewardsTransactionId( adKey, rewardsTransactionId )

##### adKey ~^(required)^~
_[String][api.type.String]._ The ad key returned for a previously created ad.

##### rewardsTransactionId ~^(required)^~
_[String][api.type.String]._ The rewards transaction&nbsp;ID to be sent for the ad.


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

appnext.setRewardsTransactionId( rewardedAdKey, "YOUR_REWARDS_TRANSACTION_ID" )
``````
