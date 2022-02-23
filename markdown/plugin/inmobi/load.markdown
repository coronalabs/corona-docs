# inMobi.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, InMobi, load
> __See also__          [inMobi.show()][plugin.inmobi.show]
>						[inMobi.isLoaded()][plugin.inmobi.isLoaded]
>						[inMobi.*][plugin.inmobi]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Preloads an InMobi ad. You can also call [inMobi.isLoaded()][plugin.inmobi.isLoaded] to verify that the ad has been loaded and [inMobi.show()][plugin.inmobi.show] to show it.


## Syntax

	inMobi.load( adUnitType, placementID [, params] )

##### adUnitType ~^(required)^~
_[String][api.type.String]._ The type of ad according to the InMobi placement&nbsp;ID. Supported values are `"banner"` or `"interstitial"`.

##### placementID ~^(required)^~
_[String][api.type.String]._ The placement ID for the ad, retrieved from the [InMobi developer portal](https://www.inmobi.com/portal/). This is a numeric string and is listed in the [InMobi developer portal](https://www.inmobi.com/portal/) under the label __Placement&nbsp;ID__.

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table containing customization parameters for banner ads &mdash; see the next section for details.


## Parameter Reference

The `params` table can include properties for customizing a banner ad. This does not apply to interstitial ads.

##### width ~^(optional)^~
_[Number][api.type.Number]._ The width of the banner ad. InMobi returns a <nobr>"best fit"</nobr> ad for the banner dimensions specified. Default is `320`.

##### height ~^(optional)^~
_[Number][api.type.Number]._ The height of the banner ad. InMobi returns a <nobr>"best fit"</nobr> ad for the banner dimensions specified. Default is `50`.

##### autoRefresh ~^(optional)^~
_[Boolean][api.type.Boolean]._ Boolean value that determines if a banner ad should <nobr>auto-refresh</nobr> at a given interval <nobr>(see `refreshInterval` below)</nobr>. Default is `false`.

##### refreshInterval ~^(optional)^~
_[Number][api.type.Number]._ The refresh interval, in seconds, for which banner ads should <nobr>auto-refresh</nobr>. This only applies if `autoRefresh` is set to `true`. Default is `60`.


## Example

``````lua
local inMobi = require( "plugin.inMobi" )

-- Pre-declare a placement ID
local placementID = "PLACEMENT_ID"

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load a banner ad
		inMobi.load( "banner", placementID )

	elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
		print( event.type )
		print( event.placementId )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.placementId )
		print( event.isError )
		print( event.response )
	end
end

-- Initialize the InMobi plugin
inMobi.init( adListener, { accountId="YOUR_ACCOUNT_ID" } )
``````
