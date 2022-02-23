# chartboost.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Chartboost, load
> __See also__			[chartboost.init()][plugin.chartboost.init]
>						[chartboost.show()][plugin.chartboost.show]
>						[chartboost.isLoaded()][plugin.chartboost.isLoaded]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Pre-loads a Chartboost static interstitial, video interstitial, rewarded video, or the "more&nbsp;apps" screen for instant loading upon a future call to [chartboost.show()][plugin.chartboost.show].


## Gotchas

* Before calling this function, you must call [chartboost.init()][plugin.chartboost.init] and wait for the `"init"` event [phase][plugin.chartboost.event.adsRequest.phase].


## Syntax

	chartboost.load( adType [, namedLocation] )

##### adType ~^(required)^~
_[String][api.type.String]._ One of the following values:

* `"interstitial"`
* `"rewardedVideo"`
* `"moreApps"` (Deprecated. Will be removed from the Chartboost SDK in July 2017)

##### namedLocation ~^(optional)^~
_[String][api.type.String]._ The advertisement location. If omitted, the legacy `"Default"` location will be used. Although you can specify any string, Chartboost recommends using one of their <nobr>pre-defined</nobr> locations to help keep eCPM levels as high as possible. See [here][REFLINK 1] for a list of valid <nobr>pre-defined</nobr> options.

<!--- REFERENCE LINK -->

[REFLINK 1]: ../../plugin/chartboost/show.html#locations


## Example

``````lua
local chartboost = require( "plugin.chartboost" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Pre-load the "more apps" screen
		chartboost.load( "interstitial" )
	end
end

-- Initialize the Chartboost plugin
chartboost.init( adListener, { appId="YOUR_CHARTBOOST_APP_ID", appSig="YOUR_CHARTBOOST_APP_SIGNATURE" } )
``````
