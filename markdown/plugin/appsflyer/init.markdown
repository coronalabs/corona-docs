# appsflyer.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, AppsFlyer, init
> __See also__			[appsflyer.*][plugin.appsflyer]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`appsflyer.init()` initializes the AppsFlyer SDK.

Once initialized, you can call any of the other AppsFlyer API functions such as [appsflyer.logEvent()][plugin.appsflyer.logEvent].


## Syntax

	appsflyer.init( listener, params )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener that will receive [analyticsRequest][plugin.appsflyer.event.analyticsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing AppsFlyer initialization values &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for the AppsFlyer initialization.

##### appID ~^(required)^~
_[String][api.type.String]._ Your AppsFlyer App&nbsp;GUID, gathered from the [AppsFlyer](hhttp://appsflyer.com) system. Note that you need to set the app ID here with digits only, without the `id` prefix.

##### devKey ~^(required)^~
_[String][api.type.String]._ Your AppsFlyer Developer Key, gathered from the [AppsFlyer](hhttp://appsflyer.com) system.

##### enableDebugLogging ~^(optional)^~
_[Boolean][api.type.Boolean]._ Debug logging will display extra information in the device log for easier troubleshooting. Default is `false`.

##### hasUserConsent ~^(optional)^~
_[Boolean][api.type.Boolean]._ To ease work with GDPR compliance of your app, change this init parameter to the needed value. If set to `false`, AppsFlyer will enable GDPR data collection restrictions, set to `true` for opposite. Default is `false`.


## Example

``````lua
local appsflyer = require( "plugin.appsflyer" )

local function appsflyerListener( event )
	-- Handle events here
end

-- Initialize plugin
appsflyer.init( appsflyerListener,
	{
		appID = "YOUR_APP_ID",
       devKey = "YOUR_DEV_KEY",
		enableDebugLogging = true,
       hasUserConsent = true
	}
)
``````
