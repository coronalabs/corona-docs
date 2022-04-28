# vungle.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle
> __See also__          [vungle.init()][plugin.vungle-v6.init]
>						[vungle.load()][plugin.vungle-v6.load]
>						[vungle.*][plugin.vungle-v6]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`vungle.show()` begins playing a placement <nobr>full-screen</nobr> video ad if one is cached and available for display.

This API returns a boolean `true` or `false` depending on the availability of a cached video ad.


## Syntax

	vungle.show( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ A table that specifies properties for the ad request &mdash; see the next section for details.


## Parameter Reference

The `params` table includes properties for the ad request.

##### placementID ~^(required)^~
_[String][api.type.String]._ The placement ID of the ad to show.

##### isAutoRotation ~^(required)^~
_[Boolean][api.type.Boolean]._ If `true` (default), the video ad will rotate automatically with the device's orientation. If `false`, it will use the ad's preferred orientation. This is required for Android only&nbsp;&mdash; for iOS, it looks into the `orientations` key.

##### orientation ~^(optional)^~
_[Number][api.type.Number]._ For iOS only, the bitmask with the possible orientation values. Default is `UIInterfaceOrientationMaskAll`.

##### isSoundEnabled ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true` (default), sound will be enabled during video ad playback, subject to the device's sound settings. If `false`, video playback will begin muted. Note that the user can mute or <nobr>un-mute</nobr> sound during playback.

##### username ~^(optional)^~
_[String][api.type.String]._ This parameter only applies to the incentivized ad unit type. When specified, it represents the user identifier that you wish to receive in a <nobr>server-to-server</nobr> callback that rewards the user for a completed video ad view.

##### alertTitle, alertText, alertContinue ~^(optional)^~
_[String][api.type.String]._ You can customize a message to display to users when they attempt to close the incentivized video before completion. Note that this setting only applies to standard Vungle ads. For "Dynamic&nbsp;Template" ads, the same customization is available on the Vungle&nbsp;Dashboard.

##### immersive ~^(optional)^~
_[String][api.type.Boolean]._ For Android only, enables or disables immersive mode on KitKat+ devices.

##### large ~^(optional)^~
_[String][api.type.Boolean]._ For iOS only, draws larger buttons that control ad functions such as mute or close.


## Example

``````lua
local vungle = require( "plugin.vungle.v6" )

local appID
if ( system.getInfo("platform") == "android" ) then
	appID = "YOUR_ANDROID_APP_ID"
else
	appID = "YOUR_IOS_APP_ID"
end

-- Vungle listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
	end
end

-- Initialize the Vungle plugin
vungle.init( appID, adListener )

local adShown = vungle.show( { placementId="placementID1", isSoundEnabled=true } )
``````
