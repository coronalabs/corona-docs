# vungle.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle
> __See also__          [vungle.init()][plugin.vungle-v6.init]
>						[vungle.*][plugin.vungle-v6]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`vungle.load()` begins loading a placement video ad.

This API returns a boolean `true` if loading is successful, `false` otherwise.


## Syntax

	vungle.load( placementID )

##### placementID ~^(required)^~
_[String][api.type.String]._ The placement ID of the ad to load.


## Example

``````lua
local vungle = require( "plugin.vungle.v6" )

local appID
if ( system.getInfo("platform") == "android" ) then
	appID = "YOUR_ANDROID_APP_ID"
else
	appID = "YOUR_IOS_APP_ID"
end

-- Vungle listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
	end
end

-- Initialize the Vungle plugin
vungle.init( appID, adListener )

-- Sometime later, load an ad for a specific placement
vungle.load( "placementID1" )
``````
