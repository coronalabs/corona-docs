# superawesome.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, SuperAwesome, load
> __See also__          [superawesome.show()][plugin.superawesome.show]
>						[superawesome.isLoaded()][plugin.superawesome.isLoaded]
>						[superawesome.*][plugin.superawesome]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Preloads a SuperAwesome ad. You can also call [superawesome.isLoaded()][plugin.superawesome.isLoaded] to verify that the ad has been loaded and [superawesome.show()][plugin.superawesome.show] to show it.


## Syntax

	superawesome.load( adUnitType, params )

##### adUnitType ~^(required)^~
_[String][api.type.String]._ The type of ad according to the SuperAwesome placement&nbsp;ID. Supported values are `"banner"`, `"interstitial"`, or `"video"`.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing customization parameters for the specified ad type — see the next section for details.


## Parameter Reference

The `params` table containing customization parameters for the specified ad type.

##### placementId ~^(required)^~
_[String][api.type.String]._ The placement ID for the ad to be loaded, retrieved from the [SuperAwesome dashboard](http://dashboard.superawesome.tv/).

##### bannerSize ~^(optional)^~
_[String][api.type.String]._ The size of the banner ad. Valid options include `"BANNER_50"`, `"BANNER_90"`, and `"BANNER_250"`. Default is `"BANNER_50"`.

##### bannerTransparency ~^(optional)^~
_[Boolean][api.type.Boolean]._ Specifies if the banner background should be transparent. Default is `false`.


## Example

``````lua
local superawesome = require( "plugin.superawesome" )

-- Pre-declare a placement ID
local myPlacementID = "YOUR_PLACEMENT_ID"

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load a banner ad
		superawesome.load( "banner", { placementId=myPlacementID } )

	elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
		print( event.type )
		print( event.placementId )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.placementId )
		print( event.isError )
	end
end

-- Initialize the SuperAwesome plugin
superawesome.init( adListener, { testMode=true } )
``````
