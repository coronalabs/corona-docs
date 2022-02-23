# appsflyer.logEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, AppsFlyer, logEvent
> __See also__			[appsflyer.getVersion()][plugin.appsflyer.getVersion]
>						[appsflyer.*][plugin.appsflyer]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sends a custom event or an event with pre-defined types and parameters to AppsFlyer.

## Syntax

	appsflyer.logEvent( eventName, params )

##### eventName ~^(required)^~
_[String][api.type.String]._ The name of the event. An in-app event name must not be longer than 45 characters. Event names with more than 45 characters do not appear in the dashboard, but only in the raw Data, Pull and Push APIs.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing key-value parameters. In-App Events provide insights on what is happening in your app. It is recommended to take the time and define the events you want to measure to allow you to track ROI (Return on Investment) and LTV (Lifetime Value).

You may specify your own custom key-value parameters. Values may be of type String, Number or Boolean.


## Examples

##### Game Level Completed

``````lua
local appsflyer = require( "plugin.appsflyer" )

local function appsflyerListener( event )
	-- Handle events here
end

-- Initialize plugin
appsflyer.init( appsflyerListener,
	{
		appID = "YOUR_APP_ID",
       devKey = "YOUR_DEV_KEY"
	}
)

appsflyer.logEvent( "levelComplete",
	{
		userId = "USER_ID",
		level = "2",
		score = "22000"
	}
)
``````
