# unityads.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Unity Ads, isLoaded
> __See also__          [unityads.show()][plugin.unityads-v4.show]
>						[unityads.*][plugin.unityads-v4]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a [boolean][api.type.Boolean] indicating whether an ad is loaded and ready for display.


## Syntax

    unityads.isLoaded( placementId )

##### placementId ~^(required)^~
_[String][api.type.String]._ One of the placement IDs you've configured in the Unity&nbsp;Ads [dashboard](https://unity3d.com/services/ads).


## Example

``````lua
local unityads = require( "plugin.unityads.v4" )

-- Unity Ads listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
	end
end

-- Initialize the Unity Ads plugin
unityads.init( adListener, { appId="YOUR_UNITYADS_GAME_ID" } )

-- Sometime later, check if an ad (placement ID) is ready for display
print( unityads.isLoaded( "YOUR_UNITYADS_PLACEMENT_ID" ) )
``````
