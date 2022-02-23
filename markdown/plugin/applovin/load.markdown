# applovin.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			ads, advertising, AppLovin, load
> __See also__			[applovin.show()][plugin.applovin.show]
>						[applovin.isLoaded()][plugin.applovin.isLoaded]
>						[applovin.*][plugin.applovin]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Preloads a AppLovin ad. You can also call [applovin.isLoaded()][plugin.applovin.isLoaded] to verify that the ad has been loaded and [applovin.show()][plugin.applovin.show] to show it.


## Syntax

	applovin.load( adType )

##### adType ~^(required)^~
_[String][api.type.String]._ One of the following values:

* `"banner"`
* `"interstitial"`
* `"rewardedVideo"`

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* When you use `"interstitial"`, both static interstitial ads and video interstitial ads may be loaded. You configure the type of ads to be used in the [AppLovin developer portal](https://www.applovin.com/manage). 

* You must enable "Rewarded&nbsp;Video" in the [AppLovin developer portal](https://www.applovin.com/manage) to receive rewarded videos in your app.

* Rewarded video offers can be limited to a certain amount in a given day, defined under "frequency&nbsp;capping" in the [AppLovin developer portal](https://www.applovin.com/manage). If you are using frequency capping, we recommend that you check for an [event.phase][plugin.applovin.event.adsRequest.phase] value of `"validationExceededQuota"` to determine if the limit has been reached. When this occurs, you may consider loading/showing an interstitial ad instead.

</div>

##### params ~^(optiional)^~
_[Table][api.type.Table]._ Table containing AppLovin ad loading options.


## Parameter Reference

The `params` table includes parameters for the AppLovin ad loading.

##### bannerSize ~^(optional)^~
_[String][api.type.String]._ Valid values: `"standard"` (typically 320 x 50), `"leader"` (typically 768 x 90) and `"mrec"` (typically 320 x 250). Default is `"standard"`.


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
	end
end

-- Initialize the AppLovin plugin
applovin.init( adListener, { sdkKey="YOUR_SDK_KEY" } )
``````
