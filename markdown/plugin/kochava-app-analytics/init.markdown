# kochavaFAA.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Kochava Free App Analytics, init
> __See also__			[kochavaFAA.*][plugin.kochava-app-analytics]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`kochavaFAA.init()` initializes the Kochava SDK.

Once initialized, you can call any of the other functions such as [kochavaFAA.logEvent()][plugin.kochava-app-analytics.logEvent].


## Syntax

	kochavaFAA.init( listener, params )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener that will receive [analyticsRequest][plugin.kochava-app-analytics.event.analyticsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing Kochava initialization values &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for the Kochava initialization.

##### appGUID ~^(required)^~
_[String][api.type.String]._ Your App&nbsp;GUID, gathered from the [Kochava Free App Analytics](https://www.freeappanalytics.com/sign-in/) system.

##### limitAdTracking ~^(optional)^~
_[Boolean][api.type.Boolean]._ Limits ad tracking when set to `true`. Default is `false`.

##### enableDebugLogging ~^(optional)^~
_[Boolean][api.type.Boolean]._ Debug logging will display extra information in the device log for easier troubleshooting. Default is `false`.

##### enableAttributionData ~^(optional)^~
_[Boolean][api.type.Boolean]._ Request for attribution data to be retrieved from Kochava. The data will be sent to the Corona listener given when calling this function. Default is `false`.

##### hasUserConsent ~^(optional)^~
_[Boolean][api.type.Boolean]._ To ease work with GDPR compliance of your app, you can just change this init parameter to the needed value. If set to `false`, Kochava will enable GDPR data collection restrictions, set to `true` for opposite. If this parameter enabled, `intelligentConsentManagement` is ignored. Default is `false`.

##### intelligentConsentManagement ~^(optional)^~
_[Boolean][api.type.Boolean]._ For more precise work with GDPR restrictions, you can use this init parameter. If set to `true` you will be getting notifications from Kochava about consent status changes. Then you should call [kochava.setHasUserConsent()][plugin.kochava.setHasUserConsent] manually. Look at [kochava.setHasUserConsent()][plugin.kochava.setHasUserConsent] documentation for more info. If this parameter enabled, `hasUserConsent` is ignored. Default is `false`.



## Example

``````lua
local kochavaFAA = require( "plugin.kochava.faa" )

local function kochavaListener( event )
	-- Handle events here
end

-- Initialize plugin
kochavaFAA.init( kochavaListener,
	{
		appGUID = "YOUR_APP_GUID",
		enableDebugLogging = true
	}
)
``````
