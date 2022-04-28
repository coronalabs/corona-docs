# vungle.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle, isLoaded
> __See also__          [vungle.show()][plugin.vungle-v6.show]
>						[vungle.*][plugin.vungle-v6]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a [boolean][api.type.Boolean] indicating whether an ad is loaded and ready for display.


## Syntax

    vungle.isLoaded( placementId )

##### placementId ~^(required)^~
_[String][api.type.String]._ The placement ID to check if loaded


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

-- Sometime later, check if an ad (placement ID) is ready for display
print( vungle.isLoaded( "placementID1" ) )
``````
