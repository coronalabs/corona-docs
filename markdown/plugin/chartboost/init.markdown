# chartboost.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Chartboost, init
> __See also__			[chartboost.load()][plugin.chartboost.load]
>						[chartboost.show()][plugin.chartboost.show]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`chartboost.init()` initializes the Chartboost plugin. This call is required and must be executed before making other Chartboost calls such as [chartboost.load()][plugin.chartboost.load] or [chartboost.show()][plugin.chartboost.show].


## Syntax

	chartboost.init( listener, params )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.chartboost.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing Chartboost initialization values — see the next section for details.


## Parameter Reference

The `params` table includes parameters for Chartboost initialization.

##### appId ~^(required)^~
_[String][api.type.String]._ The App ID for your app, gathered from the Chartboost [dashboard](https://www.chartboost.com/).

##### appSig ~^(required)^~
_[String][api.type.String]._ The App signature for your app, gathered from the Chartboost [dashboard](https://www.chartboost.com/).

##### autoCacheAds ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, Chartboost will automatically attempt to load another ad when one has been consumed via a [chartboost.show()][plugin.chartboost.show] call. When `false`, it's your responsibility to manage loading behavior. Default is `false`.

##### customId ~^(optional)^~
_[String][api.type.String]._ Use this to set a custom identifier that can be used to group information in the Chartboost dashboard.

##### hasUserConsent ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `false`, Chartboost will enable GDPR data collection restrictions, set to `true` for opposite. Default is `false`.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For developers migrating from the Corona Ads incarnation of the Chartboost plugin, the following parameters have been __removed__ from this new plugin:

* `apiKey`; replaced by `appId` and `appSig`
* `testMode`; this is now set per-app in the Chartboost dashboard
* `appOrientation`; this is now set per-app in the Chartboost dashboard

</div>

## Example

``````lua
local chartboost = require( "plugin.chartboost" )

-- Chartboost listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
	end
end

-- Initialize the Chartboost plugin
chartboost.init( adListener, { appId="YOUR_CHARTBOOST_APP_ID", appSig="YOUR_CHARTBOOST_APP_SIGNATURE" } )
``````
