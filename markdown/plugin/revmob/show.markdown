# revmob.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, RevMob, show
> __See also__          [revmob.init()][plugin.revmob.init]
>						[revmob.load()][plugin.revmob.load]
>						[revmob.isLoaded()][plugin.revmob.isLoaded]
>						[revmob.*][plugin.revmob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a RevMob ad which was previously loaded via [revmob.load()][plugin.revmob.load].


## Syntax

	revmob.show( placementId [, params] )

##### placementId ~^(required)^~
_[String][api.type.String]._ The placement ID of the ad you want to show.

##### params ~^(optional)^~
_[Table][api.type.Table]._ Optional table containing placement customization values &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters to customize the ad placement.

##### yAlign ~^(required)^~
_[String][api.type.String]._ The vertical alignment of a RevMob banner ad. Valid options are `"top"`, `"center"`, or `"bottom"`.


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
``````
