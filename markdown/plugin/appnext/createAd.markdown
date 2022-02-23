# appnext.createAd()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, createAd
> __See also__          [appnext.loadAd()][plugin.appnext.loadAd]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function is used to create an ad with a specific type and placement&nbsp;ID. If an ad with the same type and placement&nbsp;ID already exists, it will not be recreated.


## Syntax

	appnext.createAd( adType, placementID [, configParams] )

##### adType ~^(required)^~
_[String][api.type.String]._ The type of the ad. Possible values include `"interstitial"`, `"fullscreen"`, and `"rewarded"`.

##### placementID ~^(required)^~
_[String][api.type.String]._ The placement&nbsp;ID for the ad.

##### configParams ~^(optional)^~
_[Table][api.type.Table]._ A Lua table with configuration parameters for the created ad — see the next section for details.


## Parameter Reference

The `configParams` table includes configuration parameters for the ad.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* Certain parameters apply only to specific ad types, per the indicated sections.
* Following creation of the ad, parameters can also be set and read via related [appnext.set*][plugin.appnext.set] and [appnext.get*][plugin.appnext.get] functions.

</div>

### General

* `Categories` — A comma-delimited list of [strings][api.type.String] which set the preferred ad categories.
* `Postback` — Postback parameters \([string][api.type.String]\) that will be posted to your server after user installs an app. Make sure to encode the values.
* `ButtonText` — [String][api.type.String] indicating the install button's text. Default is `"Install"`.
* `ButtonColor` — [String][api.type.String] indicating the install button's color as a <nobr>6-character</nobr> hexadecimal color starting with `#`.
* `PreferredOrientation` — [String][api.type.String] which sets the preferred orientation, assuming both landscape and portrait are supported by the application. Possible values are `"automatic"`, `"landscape"`, or `"portrait"`. Default is `"automatic"`.
* `BackButtonCanClose` — Android only; [boolean][api.type.Boolean] value indicating if the "Back" key can close the ad. Default is `false`.
* `Mute` — [Boolean][api.type.Boolean] value which can mute the video which is played in the ad. Default is `false`.

### Interstitial

* `CreativeType` — [String][api.type.String] which sets the creative type for the main section of the interstitial. Possible values are `"managed"`, `"video"`, or `"static"`. Default is `"managed"`.
* `SkipText` — [String][api.type.String] which sets a custom text for the "skip" button. Default is `"Skip"`.
* `AutoPlay` — [Boolean][api.type.Boolean] which sets the video to <nobr>auto-play</nobr>. Default is `true`.

### Full-Screen / Rewarded

* `ProgressType` — [String][api.type.String] which sets or hides the progress type. Possible values are `"clock"`, `"bar"`, `"none"`, or `"default"`. Default is `"clock"`.
* `ProgressColor` — [String][api.type.String] indicating the progress bar and clock color as a <nobr>6-character</nobr> hexadecimal color starting with `#`.
* `VideoLength` — [String][api.type.String] indicating the video length of 15 or 30 seconds. Possible values are `"15"`, `"30"`, or `"default"`. Default is `"15"`.
* `ShowClose` — [Boolean][api.type.Boolean] value which can display or hide the "close" button.
* `CloseDelay` — If the "close" button is shown, this delays its appearance by the set [number][api.type.Number] value, in&nbsp;seconds.

### Rewarded

* `RewardsTransactionId` — [String][api.type.String] indicating a transaction&nbsp;ID per ad view. Make sure this is a __unique__ rewards&nbsp;ID.
* `RewardsUserId` — [String][api.type.String] indicating the user ID so that you will know which user to reward.
* `RewardsRewardTypeCurrency` — [String][api.type.String] indicating the type of reward (life/credit/points).
* `RewardsAmountRewarded` — [String][api.type.String] indicating the amount of currency that was rewarded.
* `RewardsCustomParameter` — [String][api.type.String] which allows you to pass any custom value/data.


## Example

``````lua
local appnext = require( "plugin.appnext" )

local function adListener( event )
	print( "Received " .. event.event .. " for " .. event.adKey .. " with message: " .. event.message )
end

-- Initialize the Appnext plugin
appnext.init( adListener )

-- Create your ads
local interstitialPlacementID
local fullscreenPlacementID
local rewardedPlacementID

local platform = system.getInfo( "platformName" )
if ( platform == "iPhone OS" ) then
	interstitialPlacementID = "YOUR_IOS_INTERSTITIAL_PLACEMENT_ID"
	fullscreenPlacementID = "YOUR_IOS_FULLSCREEN_PLACEMENT_ID"
	rewardedPlacementID = "YOUR_IOS_REWARDED_PLACEMENT_ID"
elseif ( platform == "Android" ) then
	interstitialPlacementID = "YOUR_ANDROID_INTERSTITIAL_PLACEMENT_ID"
	fullscreenPlacementID = "YOUR_ANDROID_FULLSCREEN_PLACEMENT_ID"
	rewardedPlacementID = "YOUR_ANDROID_REWARDED_PLACEMENT_ID"
end

local interstitialConfig = {
	SkipText = "Close Ad",
	CreativeType = "video"
}

local videoConfig = {
	ShowClose = true,
	CloseDelay = 5.5
}

local interstitialAdKey = appnext.createAd( "interstitial", interstitialPlacementID, interstitialConfig )
local fullscreenAdKey = appnext.createAd( "fullscreen", fullscreenPlacementID, videoConfig )
local rewardedAdKey = appnext.createAd( "rewarded", rewardedPlacementID )
``````
