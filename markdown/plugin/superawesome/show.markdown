# superawesome.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, SuperAwesome, show
> __See also__          [superawesome.hide()][plugin.superawesome.hide]
>						[superawesome.init()][plugin.superawesome.init]
>						[superawesome.load()][plugin.superawesome.load]
>						[superawesome.isLoaded()][plugin.superawesome.isLoaded]
>						[superawesome.*][plugin.superawesome]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a SuperAwesome ad which was previously loaded via [superawesome.load()][plugin.superawesome.load].


## Syntax

	superawesome.show( placementID [, params] )

##### placementID ~^(required)^~
_[String][api.type.String]._ The placement ID for the ad, retrieved from the [SuperAwesome dashboard](http://dashboard.superawesome.tv/).

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table containing optional parameters for ads — see the next section for details.


## Parameter Reference

The `params` table can include properties for ads:

##### useParentalGate ~^(optional)^~
_[Boolean][api.type.Boolean]._ Indicates if a parental gate (simple math question popup) will be shown when an ad is clicked. Default is `false`.

##### showVideoCloseButton ~^(optional)^~
_[Boolean][api.type.Boolean]._ Applies to video ads only; indicates if the ad will show a close button during playback. Default is `true`.

##### closeVideoAtEnd ~^(optional)^~
_[Boolean][api.type.Boolean]._ Applies to video ads only; indicates whether the ad will automatically close when its playback completes. Default is `false`.

##### useSmallClickZone ~^(optional)^~
_[Boolean][api.type.Boolean]._ Applies to video ads only; if `true`, displays a small clickable text element at the bottom of the ad, leaving the rest of the ad unclickable. If `false`, the entire ad is clickable. Default is `false`.

##### lockOrientation ~^(optional)^~
_[String][api.type.String]._ Does not apply to banners; allows you to lock the orientation of the ad. Valid values are `"landscape"` and `"portrait"`. By default, the ad will change orientation according to the device orientation.

##### y ~^(optional)^~
_[String][api.type.String] or [Number][api.type.Number]._ Only applies to banner ads, specifying the banner's __y__ position on the screen. If you supply a [string][api.type.String], valid position values are `"top"`, `"center"` and `"bottom"`. Alternatively, you can set a custom __y__ position by specifying a [number][api.type.Number] in content coodinates where `0` indicates the top edge of the screen or where a negative value specifies an offset from the bottom edge of the screen to the bottom edge of the banner. Default is `"bottom"`.


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

-- Sometime later, show the ad
if ( superawesome.isLoaded( myPlacementID ) ) then
	superawesome.show( myPlacementID, { y="bottom" } )
end

``````
