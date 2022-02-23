# appsflyer.getVersion()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, AppsFlyer, getVersion
> __See also__          [appsflyer.*][plugin.appsflyer]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Function returns plugin version. The data returned is formatted as a `pluginVersion` - current Corona AppsFlyer plugin version and `sdkVersion` - current AppsFlyer SDK version in [event.data][plugin.appsflyer.event.adsRequest.data].


## Syntax

	appsflyer.getVersion()


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
devKey = "YOUR_DEV_KEY"
}
)

-- Sometime later, after AppsFlyer will be fully initialized get plugin and SDK versions
appsflyer.getVersion()
``````
