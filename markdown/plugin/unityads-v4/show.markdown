# unityads.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Unity Ads, show
> __See also__          [unityads.isLoaded()][plugin.unityads-v4.isLoaded]
>						[unityads.*][plugin.unityads-v4]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a LevelPlay interstitial or rewarded video ad. The ad must be loaded first via [unityads.load()][plugin.unityads-v4.load] and the `"loaded"` [event.phase][plugin.unityads-v4.event.adsRequest.phase] received before calling this.


## Syntax

    unityads.show( adUnitId )

##### adUnitId ~^(required)^~
_[String][api.type.String]._ The ad unit ID configured in the [LevelPlay dashboard](https://dashboard.is.com).


## Example

``````lua
local unityads = require( "plugin.unityads.v4" )

local adUnitId = "YOUR_AD_UNIT_ID"

-- Unity Ads listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
		-- Load ad after init
		unityads.load( adUnitId )
	end
end

-- Initialize the plugin
unityads.init( adListener, { gameId="YOUR_LEVELPLAY_APP_KEY" } )

-- Sometime later, show the ad
if ( unityads.isLoaded( adUnitId ) ) then
	unityads.show( adUnitId )
end
``````
