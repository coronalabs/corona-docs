# appnext.setPreferredOrientation()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, setPreferredOrientation
> __See also__          [appnext.getPreferredOrientation()][plugin.appnext.getPreferredOrientation]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the preferred orientation, assuming both landscape and portrait are supported by the application.


## Syntax

	appnext.setPreferredOrientation( adKey, preferredOrientation )

##### adKey ~^(required)^~
_[String][api.type.String]._ The ad key returned for a previously created ad.

##### preferredOrientation ~^(required)^~
_[String][api.type.String]._ The preferred orientation to be set for the ad. Possible values are `"automatic"`, `"landscape"`, and `"portrait"` <nobr>(default is `"automatic"`)</nobr>.


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
``````
