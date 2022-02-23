# appnext.setCloseDelay()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, setCloseDelay
> __See also__          [appnext.getCloseDelay()][plugin.appnext.getCloseDelay]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Effects full-screen and rewarded ads only. If the "close" button is shown, delays its appearance by the set number of seconds.


## Syntax

	appnext.setCloseDelay( adKey, closeDelay )

##### adKey ~^(required)^~
_[String][api.type.String]._ The ad key returned for a previously created ad.

##### closeDelay ~^(required)^~
_[Number][api.type.Number]._ The delay of the "close" button's appearance for the ad.


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

appnext.setCloseDelay( fullscreenAdKey, 5.5 )
``````
