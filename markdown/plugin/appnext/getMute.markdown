# appnext.getMute()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, getMute
> __See also__          [appnext.setMute()][plugin.appnext.setMute]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Gets whether the video which is played in the ad is muted.


## Syntax

	appnext.getMute( adKey )

##### adKey ~^(required)^~
_[String][api.type.String]._ The ad key returned for a previously created ad.


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

appnext.setMute( fullscreenAdKey, true )

if ( appnext.getMute( fullscreenAdKey ) ) then
	print( "Video is muted" )
else
	print( "Video is not muted" )
end
``````
