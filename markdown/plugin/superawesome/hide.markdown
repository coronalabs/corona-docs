# superawesome.hide()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, SuperAwesome, hide
> __See also__          [superawesome.show()][plugin.superawesome.show]
>						[superawesome.*][plugin.superawesome]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Hides a currently displayed SuperAwesome banner ad. Does not apply to interstitial or video ads.


## Syntax

	superawesome.hide( placementID )

##### placementID ~^(required)^~
_[String][api.type.String]._ The placement ID for the currently displayed ad, retrieved from the [SuperAwesome dashboard](http://dashboard.superawesome.tv/).


## Example

``````lua
local superawesome = require( "plugin.superawesome" )

-- Pre-declare a placement ID
local myPlacementID = "YOUR_PLACEMENT_ID"

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load a banner ad
		superawesome.load( "banner", { placementId=myPlacementID, bannerSize="BANNER_50" } )

	elseif ( event.phase == "loaded" ) then  
		-- The ad was successfully loaded
		print( event.placementId )
	end
end

-- Initialize the SuperAwesome plugin
superawesome.init( adListener, { testMode=true } )

-- Sometime later, show the banner ad
if ( superawesome.isLoaded( myPlacementID ) ) then
	superawesome.show( myPlacementID, { y="bottom" } )
end

-- Sometime after showing the banner ad, hide it
superawesome.hide( myPlacementID )
``````
