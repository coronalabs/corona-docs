# revmob.hide()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, RevMob, hide
> __See also__          [revmob.show()][plugin.revmob.show]
>						[revmob.*][plugin.revmob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Hides a RevMob banner ad which was previously shown via [revmob.show()][plugin.revmob.load].


## Syntax

	revmob.hide( placementId )

##### placementId ~^(required)^~
_[String][api.type.String]._ The placement ID of the ad you want to hide.


## Example

``````lua
local revmob = require( "plugin.revmob" )

local placementID = "PLACEMENT_ID"

local function adListener( event )

	if ( event.phase == "sessionStarted" ) then  -- Successful initialization
		-- Load a RevMob ad
		revmob.load( "banner", placementID )

	elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
		-- Show the ad
		revmob.show( placementID, { yAlign="top" } )
	end
end

-- Initialize RevMob
revmob.init( adListener, { appId="YOUR_APP_ID" } )

-- Sometime later, hide the ad
revmob.hide( placementID )
``````
