# inMobi.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, InMobi, show
> __See also__          [inMobi.hide()][plugin.inmobi.hide]
>						[inMobi.load()][plugin.inmobi.load]
>						[inMobi.isLoaded()][plugin.inmobi.isLoaded]
>						[inMobi.*][plugin.inmobi]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows an InMobi ad which was previously loaded via [inMobi.load()][plugin.inmobi.load].


## Syntax

	inMobi.show( placementID [, params] )

##### placementID ~^(required)^~
_[String][api.type.String]._ The placement ID for the ad, retrieved from the [InMobi developer portal](https://www.inmobi.com/portal/). This is a numeric string and is listed in the [InMobi developer portal](https://www.inmobi.com/portal/) under the label "Placement ID".

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table containing positioning parameters for banner ads &mdash; see the next section for details.


## Parameter Reference

The `params` table can include properties for positioning a banner ad. This does not apply to interstitial ads.

##### yAlign ~^(optional)^~
_[String][api.type.String]._ Vertical alignment of the banner. Valid options are `"top"`, `"center"`, or `"bottom"`. Default is `"top"`.


## Example

``````lua
local inMobi = require( "plugin.inMobi" )

-- Pre-declare a placement ID
local placementID = "PLACEMENT_ID"

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load a banner ad
		inMobi.load( "banner", placementID )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.placementId )
		print( event.isError )
		print( event.response )
	end
end

-- Initialize the InMobi plugin
inMobi.init( adListener, { accountId="YOUR_ACCOUNT_ID" } )

-- Sometime later, check if the ad is loaded
if ( inMobi.isLoaded( placementID ) ) then
	-- Show the ad
  inMobi.show( placementID, { yAlign="bottom" } )
end
``````
