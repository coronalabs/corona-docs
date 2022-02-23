# applovinMax.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			ads, advertising, AppLovin, Applovin Max, load
> __See also__			[applovinMax.show()][plugin.applovinMax.show]
>						[applovinMax.isLoaded()][plugin.applovinMax.isLoaded]
>						[applovinMax.*][plugin.applovinMax]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Preloads a AppLovin ad. You can also call [applovinMax.isLoaded()][plugin.applovinMax.isLoaded] to verify that the ad has been loaded and [applovinMax.show()][plugin.applovinMax.show] to show it.


## Syntax

	applovinMax.load( adType )

##### adType ~^(required)^~
_[String][api.type.String]._ One of the following values:

* `"banner"`
* `"interstitial"`
* `"rewardedVideo"`

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* When you use `"interstitial"`, both static interstitial ads and video interstitial ads may be loaded. You configure the type of ads to be used in the [AppLovin developer portal](https://www.applovin.com/manage).

* You must enable "Rewarded&nbsp;Video" in the [AppLovin developer portal](https://www.applovin.com/manage) to receive rewarded videos in your app.

* Rewarded video offers can be limited to a certain amount in a given day, defined under "frequency&nbsp;capping" in the [AppLovin developer portal](https://www.applovin.com/manage).

</div>

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing AppLovin ad loading options.


## Parameter Reference

The `params` table includes parameters for the AppLovin ad loading.

##### iOSUnitId ~^(required for iOS)^~
_[String][api.type.String]._ iOS Ad Unit ID, found in [AppLovin developer portal](https://www.applovin.com/manage) under `Manage` > `Ad Units`.

##### androidUnitId ~^(required for android)^~
_[String][api.type.String]._ Android Ad Unit ID, found in [AppLovin developer portal](https://www.applovin.com/manage) under `Manage` > `Ad Units`.

##### bannerSize ~^(optional)^~
_[String][api.type.String]._ Valid values: `"standard"` (typically 320 x 50), `"leader"` (typically 768 x 90) and `"mrec"` (typically 320 x 250). Default is `"standard"`.


## Example

``````lua
local applovin = require( "plugin.applovin" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
		-- Load an AppLovin ad
		applovin.load( "interstitial", {iOSUnitId ="replace with your own", androidUnitId="replace with your own"})

	elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
		print( event.type )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.isError )
		print( event.response )
	end
end

-- Initialize the AppLovin plugin
applovin.init( adListener )
``````
