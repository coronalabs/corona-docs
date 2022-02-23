# vungle-v4.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, vungle
> __See also__          [vungle-v4.init()][plugin.vungle-v4.init]
>						[vungle-v4.*][plugin.vungle-v4]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`vungle-v4.show()` begins playing a full-screen video ad if one is cached and available for display.

For Vungle, this API returns a boolean `true` or `false` depending on the availability of a cached video ad.


## Syntax

	vungle-v4.show( adUnitType [, params] )

##### adUnitType ~^(required)^~
_[String][api.type.String]._ Vungle supports the following types:

* `"interstitial"` &mdash; default video ad unit
* `"incentivized"` &mdash; video ad unit with optional server-to-server callback for in-app rewards

##### params ~^(optional)^~
_[Table][api.type.Table]._ A table that specifies properties for the ad request &mdash; see the next section for details.


## Parameter Reference

The `params` table can include properties for the ad request.

##### isAnimated ~^(optional)^~
_[Boolean][api.type.Boolean]._ This parameter only applies to iOS. If `true` (default), the video ad will transition in with a slide effect. If `false`, it will appear instantaneously.

##### isAutoRotation ~^(required)^~
_[Boolean][api.type.Boolean]._ If `true` (default), the video ad will rotate automatically with the device's orientation. If `false`, it will use the ad's preferred orientation. This is required for Android only. For iOS, look into the `orientations` key.

##### orientations ~^(optional)^~
_[Number][api.type.Number]._ Bitmask with the possible orientation values. Default is `UIInterfaceOrientationMaskAll`.

##### isBackButtonEnabled ~^(optional)^~
_[Boolean][api.type.Boolean]._ This parameter only applies to Android. If `true`, the Android back button will stop playback of the video ad and display the post-roll. If `false` (default), the back button will be disabled during playback. Note that the back button is always enabled in the post-roll &mdash; when pressed, it exits the ad and returns to the application.

##### isSoundEnabled ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true` (default), sound will be enabled during video ad playback, subject to the device's sound settings. If `false`, video playback will begin muted. Note that the user can mute or <nobr>un-mute</nobr> sound during playback.

##### username ~^(optional)^~
_[String][api.type.String]._ This parameter only applies to the `"incentivized"` ad unit type. When specified, it represents the user identifier that you wish to receive in a <nobr>server-to-server</nobr> callback that rewards the user for a completed video ad view.

## Example

``````lua
local ads = require( "ads" )

local function adListener( event )
	if ( event.type == "adStart" and event.isError ) then
		--Cached video ad not available for display
	end
end

ads.init( "vungle", "myAppId", adListener )

local adShown = ads.show( "interstitial", { isAnimated=false, isBackButtonEnabled=true } )
``````
