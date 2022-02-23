# appnext.getPreferredOrientation()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, getPreferredOrientation
> __See also__          [appnext.setPreferredOrientation()][plugin.appnext.setPreferredOrientation]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Gets the preferred orientation for the ad.


## Syntax

	appnext.getPreferredOrientation( adKey )

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

appnext.setPreferredOrientation( fullscreenAdKey, "landscape" )

print( "Preferred Orientation: " .. appnext.getPreferredOrientation( fullscreenAdKey ) )
``````
