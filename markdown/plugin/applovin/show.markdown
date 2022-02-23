# applovin.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AppLovin, show
> __See also__          [applovin.init()][plugin.applovin.init]
>						[applovin.load()][plugin.applovin.load]
>						[applovin.isLoaded()][plugin.applovin.isLoaded]
>						[applovin.*][plugin.applovin]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a AppLovin ad which was previously loaded via [applovin.load()][plugin.applovin.load].


## Syntax

	applovin.show( adType [, placement] )

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

* Rewarded video offers can be limited to a certain amount in a given day, defined under "frequency&nbsp;capping" in the [AppLovin developer portal](https://www.applovin.com/manage). If you are using frequency capping, we recommend that you check for an [event.phase][plugin.applovin.event.adsRequest.phase] value of `"validationExceededQuota"` to determine if the limit has been reached. When this occurs, you may consider loading/showing an interstitial ad instead.

</div>


## Example

``````lua
local applovin = require( "plugin.applovin" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
		-- Load an AppLovin ad
		applovin.load( "interstitial" )

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
applovin.init( adListener, { sdkKey="YOUR_SDK_KEY" } )

-- Sometime later, show the ad
local isAdLoaded = applovin.isLoaded( "interstitial" )
if ( isAdLoaded == true ) then
	applovin.show( "interstitial" )
end
``````
