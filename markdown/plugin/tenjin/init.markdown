# tenjin.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Tenjin, init
> __See also__			[tenjin.*][plugin.tenjin]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`tenjin.init()` initializes the Tenjin SDK.

Once initialized, you can call any of the other Tenjin API functions such as [tenjin.logEvent()][plugin.tenjin.logEvent].


## Syntax

	tenjin.init( listener, params )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener that will receive [analyticsRequest][plugin.tenjin.event.analyticsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing Tenjin initialization values &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for the Tenjin initialization.

##### apiKey ~^(required)^~
_[String][api.type.String]._ Your Tenjin API&nbsp;Key, gathered from the [Tenjin](https://tenjin.io/) system.

##### hasUserConsent ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `false`, Tenjin will enable GDPR data collection restrictions, set to `true` for opposite. Default is `false`.

##### registerAppForAdNetworkAttribution ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, Tenjin SDK `registerAppForAdNetworkAttribution` will be called.

## Example

``````lua
local tenjin = require( "plugin.tenjin" )

local function tenjinListener( event )
	-- Handle events here
end

-- Initialize plugin
tenjin.init( tenjinListener, { apiKey="YOUR_API_KEY" } )
``````
