# appnext.setProgressColor()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, setProgressColor
> __See also__          [appnext.getProgressColor()][plugin.appnext.getProgressColor]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Effects full-screen and rewarded ads only. Sets the progress bar and clock color.

## Syntax

	appnext.setProgressColor( adKey, progressColor )

##### adKey ~^(required)^~
_[String][api.type.String]._ The ad key returned for a previously created ad.

##### progressColor ~^(required)^~
_[String][api.type.String]._ The color of the progress bar and clock as a <nobr>6-character</nobr> hexadecimal color starting with `#`.


## Example

``````lua
local appnext = require( "plugin.appnext" )

local function adListener( event )
	print( "Received " .. event.event .. " for " .. event.adKey .. " with message: " .. event.message )
end

-- Initialize the Appnext plugin
appnext.init( adListener )

-- Create your ads
local fullscreenPlacementID

local platform = system.getInfo( "platformName" )
if ( platform == "iPhone OS" ) then
    fullscreenPlacementID = "YOUR_IOS_FULLSCREEN_PLACEMENT_ID"
elseif ( platform == "Android" ) then
    fullscreenPlacementID = "YOUR_ANDROID_FULLSCREEN_PLACEMENT_ID"
end

local fullscreenAdKey = appnext.createAd( "fullscreen", fullscreenPlacementID )

appnext.setProgressColor( fullscreenAdKey, "#FFFFFF" )
``````
