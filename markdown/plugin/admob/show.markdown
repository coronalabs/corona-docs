# admob.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, show
> __See also__          [admob.hide()][plugin.admob.hide]
>						[admob.load()][plugin.admob.load]
>						[admob.isLoaded()][plugin.admob.isLoaded]
>						[admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows an AdMob interstitial, banner, or rewarded video ad that was previously loaded with [admob.load()][plugin.admob.load].

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Before attempting to show an ad, you must first load one via [admob.load()][plugin.admob.load] and confirm it's ready to be shown. See the [example](#example) below for basic usage details.

</div>

## Syntax

    admob.show( adType [, params] )

##### adType ~^(required)^~
_[String][api.type.String]._ One of the following values:

* `"interstitial"`
* `"banner"`
* `"rewardedVideo"`

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table containing additional parameters for the specified ad type — see the next section for details.


## Parameter Reference

The `params` table includes parameters for the specified ad type.

##### y ~^(optional)^~
_[String][api.type.String] or [Number][api.type.Number]._ Only applies to banner ads, specifying the banner's __y__ position on the screen. If you supply a [string][api.type.String], valid position values are `"top"` or `"bottom"`. Alternatively, you can set a custom __y__ position by specifying a [number][api.type.Number] in content coodinates where `0` indicates the top edge of the screen or where a negative value specifies an offset from the bottom edge of the screen to the bottom edge of the banner. Default is `"bottom"`.

##### bgColor ~^(optional)^~
_[String][api.type.String]._ Only applies to banner ads, specifying the background color of the smart banner. The value must be a hexadecimal RGB or ARGB value specified as `"#RRGGBB"` or `"#AARRGGBB"`. Default is `nil` which will render the background as transparent.

<a id="example"></a>

## Example

``````lua
local admob = require( "plugin.admob" )

-- AdMob listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load an AdMob interstitial ad
		admob.load( "interstitial", { adUnitId="YOUR_ADMOB_AD_UNIT_ID" } )
	end
end

-- Initialize the AdMob plugin
admob.init( adListener, { appId="YOUR_ADMOB_APP_ID" } )

-- Sometime later, show the interstitial ad
if ( admob.isLoaded( "interstitial" ) ) then
	admob.show( "interstitial" )
end
``````
