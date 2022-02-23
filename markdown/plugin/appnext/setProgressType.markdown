# appnext.setProgressType()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, getProgressType
> __See also__          [appnext.setProgressType()][plugin.appnext.setProgressType]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Effects full-screen and rewarded ads only. Sets or hides the progress type <nobr>(default is `"clock"`)</nobr>.


## Syntax

	appnext.setProgressType( adKey, progressType )

##### adKey ~^(required)^~
_[String][api.type.String]._ The ad key returned for a previously created ad.

##### progressType ~^(required)^~
_[String][api.type.String]._ The progress type to be set for the ad. Possible values are `"clock"`, `"bar"`, `"none"`, or `"default"`.


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

appnext.setProgressType( fullscreenAdKey, "bar" )
``````
