# applovinMax.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AppLovin, show
> __See also__          [applovinMax.init()][plugin.applovinMax.init]
>						[applovinMax.load()][plugin.applovinMax.load]
>						[applovinMax.isLoaded()][plugin.applovinMax.isLoaded]
>						[applovinMax.*][plugin.applovinMax]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a AppLovin ad which was previously loaded via [applovinMax.load()][plugin.applovinMax.load].


## Syntax

	applovinMax.show( adType [, placement] )

##### adType ~^(required)^~
_[String][api.type.String]._ One of the following values:

* `"banner"`
* `"interstitial"`
* `"rewardedVideo"`

##### params ~^(optiional)^~
_[Table][api.type.Table]._ Table containing AppLovin ad loading options.


## Parameter Reference

The `params` table includes parameters for the AppLovin ad loading.

##### placement ~^(optional)^~
_[String][api.type.String]._ The placement to be used. This must be identical to one of the placements defined for the app in the [AppLovin developer portal](https://www.applovin.com/manage).

##### y ~^(optional)^~
_[String][api.type.String]._ Only applicable for banner ads. Valid values: `"top"`, `"center"` and `"bottom"`. Default is `"top"`.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* When you use `"interstitial"`, both static interstitial ads and video interstitial ads may be shown. You configure the type of ads to be used in the [AppLovin developer portal](https://www.applovin.com/manage).

* You must enable "Rewarded&nbsp;Video" in the [AppLovin developer portal](https://www.applovin.com/manage) to receive rewarded videos in your app.

* Rewarded video offers can be limited to a certain amount in a given day, defined under "frequency&nbsp;capping" in the [AppLovin developer portal](https://www.applovin.com/manage). 

</div>


## Example

``````lua
local applovinMax = require( "plugin.applovinMax" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
		-- Load an AppLovin ad
		applovinMax.load( "interstitial", {iOSUnitId ="replace with your own", androidUnitId="replace with your own"} )

	elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
		print( event.type )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.isError )
		print( event.response )

	elseif ( event.phase == "displayed" or event.phase == "playbackBegan" ) then  -- The ad was displayed/played
		print( event.type )

	elseif ( event.phase == "hidden" or event.phase == "playbackEnded" ) then  -- The ad was closed/hidden
		print( event.type )

	elseif ( event.phase == "clicked" ) then  -- The ad was clicked/tapped
		print( event.type )
	end
end

-- Initialize the AppLovin plugin
applovinMax.init( adListener)

-- Sometime later, show the ad
local isAdLoaded = applovinMax.isLoaded( "interstitial" )
if ( isAdLoaded == true ) then
	applovinMax.show( "interstitial" )
end
``````
