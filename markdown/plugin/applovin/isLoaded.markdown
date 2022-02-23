# applovin.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		[Boolean][api.type.Boolean]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			ads, advertising, AppLovin, isLoaded
> __See also__			[applovin.show()][plugin.applovin.show]
>						[applovin.*][plugin.applovin]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Checks to see if a AppLovin ad is already loaded. Returns `true` if an ad is loaded and ready for display, otherwise returns `false`.


## Syntax

	applovin.isLoaded( adType )

##### adType ~^(required)^~
_[String][api.type.String]._ One of the following values:

* `"banner"`
* `"interstitial"`
* `"rewardedVideo"`

<div class="guide-notebox">
<div class="notebox-title">Note</div>

You must enable "Rewarded&nbsp;Video" in the [AppLovin developer portal](https://www.applovin.com/manage) to receive rewarded videos in your app.

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
	end
end

-- Initialize the AppLovin plugin
applovin.init( adListener, { sdkKey="YOUR_SDK_KEY" } )

-- Sometime later, check if the ad is loaded
local isAdLoaded = applovin.isLoaded( "interstitial" )
print( isAdLoaded )
``````
