# vungle.getVersionString()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle
> __See also__          [vungle.*][plugin.vungle]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the plugin and underlying SDK version numbers as a string.


## Syntax

	vungle.getVersionString()


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

-- Initialize the Vungle plugin
local initParams = appID .. "," .. placementID1 .. "," .. placementID2
vungle.init( "vungle", initParams )

print( vungle.getVersionString() )
``````
