# unityads.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Unity Ads, load
> __See also__          [unityads.show()][plugin.unityads-v4.show]
>						[unityads.*][plugin.unityads-v4]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Loads a LevelPlay interstitial or rewarded video ad for the given ad unit ID. You must call this before [unityads.show()][plugin.unityads-v4.show] and wait for the `"loaded"` [event.phase][plugin.unityads-v4.event.adsRequest.phase] before showing.


## Syntax

    unityads.load( adUnitId [, adType] )

##### adUnitId ~^(required)^~
_[String][api.type.String]._ The ad unit ID configured in the [LevelPlay dashboard](https://dashboard.is.com).

##### adType ~^(optional)^~
_[String][api.type.String]._ The type of ad to load. Supported values are `"interstitial"` (default) and `"rewarded"`.


## Example

``````lua
local unityads = require( "plugin.unityads.v4" )

local interstitialAdUnitId = "YOUR_INTERSTITIAL_AD_UNIT_ID"
local rewardedAdUnitId     = "YOUR_REWARDED_AD_UNIT_ID"

-- Unity Ads listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load ads after init
		unityads.load( interstitialAdUnitId )
		unityads.load( rewardedAdUnitId, "rewarded" )

	elseif ( event.phase == "loaded" ) then
		print( "Ad loaded: " .. tostring(event.data) )
	end
end

-- Initialize the plugin
unityads.init( adListener, { gameId="YOUR_LEVELPLAY_APP_KEY" } )

-- Sometime later, show an interstitial
if ( unityads.isLoaded( interstitialAdUnitId ) ) then
	unityads.show( interstitialAdUnitId )
end
``````
