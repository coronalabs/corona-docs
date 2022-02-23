# chartboost.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Chartboost, show
> __See also__			[chartboost.init()][plugin.chartboost.init]
>						[chartboost.load()][plugin.chartboost.load]
>						[chartboost.isLoaded()][plugin.chartboost.isLoaded]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a Chartboost static interstitial, video interstitial, rewarded video, or the "more&nbsp;apps" screen.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* An ad should be <nobr>pre-loaded</nobr> before calling this function. Use [chartboost.load()][plugin.chartboost.load], or enable <nobr>auto-caching</nobr> during [chartboost.init()][plugin.chartboost.init].

* Before calling this function, you must call [chartboost.init()][plugin.chartboost.init] and and ensure that the `"init"` event [phase][plugin.chartboost.event.adsRequest.phase] occurs.

</div>


## Syntax

	chartboost.show( adType [, namedLocation] )

##### adType ~^(required)^~
_[String][api.type.String]._ One of the following values:

* `"interstitial"`
* `"rewardedVideo"`
* `"moreApps"` (Deprecated. Will be removed from the Chartboost SDK in July 2017)

##### namedLocation ~^(optional)^~
_[String][api.type.String]._ The advertisement location. If omitted, the legacy `"Default"` location will be used. Although you can specify any string, Chartboost recommends using one of their <nobr>pre-defined</nobr> locations to help keep eCPM levels as high as possible. See the [list](#locations) below for valid <nobr>pre-defined</nobr> options.


<a id="locations"></a>

## Predefined Locations

The following list outlines the <nobr>pre-defined</nobr> locations recommended by Chartboost:

<div class="inner-table">

Location				Scene/Description
----------------------	--------------------------
`"Default"`				Legacy default location
`"Startup"`				Initial startup of the game
`"Home Screen"`			Home screen which the player first sees
`"Main Menu"`			Menu which provides game options
`"Game Screen"`			Game screen where the magic happens
`"Achievements"`		List of achievements in the game
`"Quests"`				Quests, missions, or goals screen
`"Pause"`				Pause screen
`"Level Start"`			Start of the level
`"Level Complete"`		Completion of the level
`"Turn Complete"`		When the player finishes a turn in the game
`"IAP Store"`			Store where the player uses real money to buy virtual goods
`"Item Store"`			Store where the player uses virtual money to buy virtual goods
`"Game Over"`			The "game over" screen
`"Leaderboard"`			List of statistical leaders in the game
`"Settings"`			Screen where player can change game settings
`"Quit"`				Screen displayed immediately before the player exits/quits
----------------------	--------------------------

</div>


## Example

``````lua
local chartboost = require( "plugin.chartboost" )

-- Chartboost listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		chartboost.load( "interstitial" )

	elseif ( event.phase == "loaded" ) then
		if ( event.type == "interstitial" ) then
			chartboost.show( "interstitial" )
		end
	end
end

-- Initialize the Chartboost plugin
chartboost.init( adListener, { appId="YOUR_CHARTBOOST_APP_ID", appSig="YOUR_CHARTBOOST_APP_SIGNATURE" } )
``````
