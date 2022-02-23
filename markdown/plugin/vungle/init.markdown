# vungle.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle
> __See also__          [vungle.load()][plugin.vungle.load]
>						[vungle.show()][plugin.vungle.show]
>						[vungle.*][plugin.vungle]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`vungle.init()` initializes the Vungle plugin. This call is required and must be executed before making other Vungle calls such as [vungle.load()][plugin.vungle.load] or [vungle.show()][plugin.vungle.show].


## Syntax

	vungle.init( providerName, initParams [, adListener] )

##### providerName ~^(required)^~
_[String][api.type.String]._ String value of `"vungle"`.

##### initParams ~^(required)^~
_[String][api.type.String]._ String containing your Vungle app&nbsp;ID plus one or more placement&nbsp;IDs, where each element is separated by a comma. For example <nobr>`"[YOUR_VUNGLE_APP_ID],[PLACEMENT_ID_1],[PLACEMENT_ID_2]"`</nobr>.

##### adListener ~^(optional)^~
_[Listener][api.type.Listener]._ The [function][api.type.Function] or [table][api.type.Table] that will handle [adsRequest][plugin.vungle.event.adsRequest] lifecycle events from the Vungle plugin.


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
``````
