# admob.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, init
> __See also__          [admob.show()][plugin.admob.show]
>						[admob.load()][plugin.admob.load]
>						[admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`admob.init()` initializes the AdMob plugin. This call is required and must be executed before making other AdMob calls such as [admob.load()][plugin.admob.load].


## Syntax

    admob.init( listener, params )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.admob.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing AdMob initialization values — see the next section for details.


## Parameter Reference

The `params` table includes parameters for AdMob initialization.

##### appId ~^(required)^~
_[String][api.type.String]._ The app ID for your app, gathered from the AdMob [dashboard](https://www.google.com/admob/).

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">
	Make sure to use same AdMob app ID as in the build.settings section of the [plugin][plugin.admob].
</div>
</div>

##### testMode ~^(optional)^~
_[Boolean][api.type.Boolean]._ Set this value to `true` to enable test ads. Default is `false`.

##### videoAdVolume ~^(optional)^~
_[Number][api.type.Number]._ Set desired volume for video ads. Valid values are in the range `0.0` - `1.0`. `0.0` for muting ads completely. Default is `1.0`.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Video ads that are ineligible to be shown with muted audio are not returned for ad requests made when the app volume is reported as muted or set to a value of 0. This may restrict a subset of the broader video ads pool from serving.

</div>

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

You should __always__ use test ads during development <nobr>(`testMode = true`)</nobr>. If you do not, Google may suspend your AdMob account if they detect that live ads have been interacted with during development.

</div>
</div>


## Example

``````lua
local admob = require( "plugin.admob" )

-- AdMob listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
	end
end

-- Initialize the AdMob plugin
admob.init( adListener, { appId="YOUR_ADMOB_APP_ID" } )
``````
