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

Shows a Unity Ads video interstitial or rewarded video ad.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Unlike the previous plugin you need load placement IDs with [unityads.load()][plugin.unityads-v4.load] and will get a [event.phase][plugin.unityads-v4.event.adsRequest.phase] `loaded`

</div>


## Syntax

    unityads.show( placementId )

##### placementId ~^(required)^~
_[String][api.type.String]._ One of the placement IDs you've configured in the Unity&nbsp;Ads [dashboard](https://unity3d.com/services/ads).


## Example

``````lua
local unityads = require( "plugin.unityads.v4" )

-- Unity Ads listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )

    --Load ad before we show
    unityads.load("YOUR_UNITYADS_PLACEMENT_ID")

	end
end

-- Initialize the Unity Ads plugin
unityads.init( adListener, { gameId="YOUR_UNITYADS_GAME_ID" } )



-- Sometime later, show an ad
if ( unityads.isLoaded( "YOUR_UNITYADS_PLACEMENT_ID" ) ) then
	unityads.show( "YOUR_UNITYADS_PLACEMENT_ID" )
end
``````
