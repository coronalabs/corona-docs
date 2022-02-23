# vungle.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle
> __See also__          [vungle.init()][plugin.vungle.init]
>						[vungle.*][plugin.vungle]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`vungle.load()` begins loading a placement video ad. This method is only needed for placements other than the <nobr>auto-cached</nobr> one because <nobr>auto-cached</nobr> ads are loaded immediately after playing the <nobr>pre-cached</nobr> ad.

This API returns a boolean `true` if loading is successful, `false` otherwise.


## Syntax

	vungle.load( placementID )

##### placementID ~^(required)^~
_[String][api.type.String]._ The placement ID of the ad to load.


## Example

``````lua
local vungle = require( "plugin.vungle" )

local appID, placementID1, placementID2
if ( system.getInfo("platform") == "android" ) then
	appID = "YOUR_ANDROID_APP_ID"
	placementID1 = "YOUR_ANDROID_PLACEMENT_ID_1"
	placementID2 = "YOUR_ANDROID_PLACEMENT_ID_2"
else
	appID = "YOUR_IOS_APP_ID"
	placementID1 = "YOUR_IOS_PLACEMENT_ID_1"
	placementID2 = "YOUR_IOS_PLACEMENT_ID_2"
end

-- Vungle listener function
local function adListener( event )

	if ( event.type == "adInitialize" ) then  -- Successful initialization
		print( event.provider )
	end
end

-- Initialize the Vungle plugin
local initParams = appID .. "," .. placementID1 .. "," .. placementID2
vungle.init( "vungle", initParams, adListener )

-- Sometime later, load an ad for a specific placement
vungle.load( placementID1 )
``````
