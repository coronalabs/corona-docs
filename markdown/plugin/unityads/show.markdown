# unityads.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Unity Ads, show
> __See also__          [unityads.isLoaded()][plugin.unityads.isLoaded]
>						[unityads.*][plugin.unityads]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a Unity Ads video interstitial or rewarded video ad.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Once you initialize the plugin with [unityads.init()][plugin.unityads.init], Unity&nbsp;Ads will automatically start loading ads for the placement IDs you've configured in the Unity&nbsp;Ads [dashboard](https://unity3d.com/services/ads).

</div>


## Syntax

    unityads.show( placementId )

##### placementId ~^(required)^~
_[String][api.type.String]._ One of the placement IDs you've configured in the Unity&nbsp;Ads [dashboard](https://unity3d.com/services/ads).


## Example

``````lua
local unityads = require( "plugin.unityads" )

-- Unity Ads listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
	end
end

-- Initialize the Unity Ads plugin
unityads.init( adListener, { gameId="YOUR_UNITYADS_GAME_ID" } )

-- Sometime later, show an ad
if ( unityads.isLoaded( "YOUR_UNITYADS_PLACEMENT_ID" ) ) then
	unityads.show( "YOUR_UNITYADS_PLACEMENT_ID" )
end
``````