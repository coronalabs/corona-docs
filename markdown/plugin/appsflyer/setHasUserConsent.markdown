# appsflyer.setHasUserConsent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, AppsFlyer, setHasUserConsent
> __See also__			[appsflyer.*][plugin.appsflyer]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

AppsFlyer provides you with an ability to annonymize specific user identifiers in AppsFlyer analytics. This complies with the latest privacy requirements and complies with Facebook data and privacy policies.


## Syntax

	appsflyer.setHasUserConsent( Boolean )


## Example

``````lua
local appsflyer = require( "plugin.appsflyer" )

local function appsflyerListener( event )
	if event.phase == "init" then
        appsflyer.setHasUserConsent( true )
    end
end

-- Initialize plugin
appsflyer.init( appsflyerListener,
	{
		appID = "YOUR_APP_ID",
       devKey = "YOUR_DEV_KEY"
	}
)
``````
