# appodeal.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appodeal, load
> __See also__			[appodeal.init()][plugin.appodeal.init]
>						[appodeal.show()][plugin.appodeal.show]
>						[appodeal.isLoaded()][plugin.appodeal.isLoaded]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Pre-loads an Appodeal banner, interstitial, or rewarded video ad for instant display upon a future call to [appodeal.show()][plugin.appodeal.show].

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

By default, Appodeal automatically caches ads in the background, so there is normally no need to load ads in advance. To use this function, you must turn off automatic caching as described in the documentation for [appodeal.init()][plugin.appodeal.init].

</div>
</div>


## Syntax

	appodeal.load( adUnitType )

##### adUnitType ~^(required)^~
_[String][api.type.String]._ Valid values include `"banner"`, `"interstitial"`, and `"rewardedVideo"`.


## Example

``````lua
local appodeal = require( "plugin.appodeal" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Pre-load a static interstitial ad
		appodeal.load( "interstitial" )
	end
end

-- Initialize the Appodeal plugin
appodeal.init( adListener, { appKey="YOUR_APP_KEY", autoCacheAds=false } )
``````
