# adcolony.getInfoForZone()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdColony, getInfoForZone
> __See also__			[adcolony.init()][plugin.adcolony.init]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Gets information about the zone and returns the result as an [adsRequest][plugin.adcolony.event.adsRequest] event with an `"info"` [phase][plugin.adcolony.event.adsRequest.phase].

See [event.data][plugin.adcolony.event.adsRequest.data] for details about the data returned.


## Syntax

	adcolony.getInfoForZone( zoneName )

##### zoneName ~^(required)^~
_[String][api.type.String]._ The user-defined AdColony zone name to get information about. Zone names should be specified in the call to [adcolony.init()][plugin.adcolony.init].


## Example

``````lua
local adcolony = require( "plugin.adcolony" )

local json = require( "json" )

-- AdColony listener function
local function adListener( event )

	if ( event.phase == "info" ) then
		-- Output zone information
		local zoneInfo = json.decode( event.data )
		print( "isRewardedZone:", zoneInfo.isRewardedZone )
		print( "virtualCurrencyName:", zoneInfo.virtualCurrencyName )
		print( "rewardAmount:", zoneInfo.rewardAmount )
		print( "viewsPerReward:", zoneInfo.viewsPerReward )
		print( "viewsUntilReward:", zoneInfo.viewsUntilReward )
	end
end

-- Initialize the AdColony plugin
adcolony.init( adListener,
	{
		appId = "YOUR_ADCOLONY_APP_ID",
		adZones = {
			interstitial = "YOUR_ADCOLONY_ZONE_ID_1",
			rewardedVideo = "YOUR_ADCOLONY_ZONE_ID_2"
		}
	})

-- Get information about a zone
print( adcolony.getInfoForZone( "interstitial" ) )
``````
