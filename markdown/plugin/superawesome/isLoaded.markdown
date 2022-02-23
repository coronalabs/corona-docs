# superawesome.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, SuperAwesome, isLoaded
> __See also__          [superawesome.show()][plugin.superawesome.show]
>						[superawesome.load()][plugin.superawesome.load]
>						[superawesome.*][plugin.superawesome]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Checks whether an ad is already loaded. Returns `true` if an ad is loaded/ready, otherwise returns `false`.


## Syntax

	superawesome.isLoaded( placementID )

##### placementID ~^(required)^~
_[String][api.type.String]._ The placement ID for the ad, retrieved from the [SuperAwesome dashboard](http://dashboard.superawesome.tv/).


## Example

``````lua
local superawesome = require( "plugin.superawesome" )

-- Pre-declare a placement ID
local myPlacementID = "YOUR_PLACEMENT_ID"

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load a banner ad
		superawesome.load( "banner", { placementId=myPlacementID } )
	end
end

-- Initialize the SuperAwesome plugin
superawesome.init( adListener, { testMode=true } )

-- Sometime later, check if the ad is loaded
local isAdLoaded = superawesome.isLoaded( myPlacementID )
print( isAdLoaded )
``````
