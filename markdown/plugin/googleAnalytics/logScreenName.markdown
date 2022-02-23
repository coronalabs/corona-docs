# googleAnalytics.logScreenName()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Google Analytics, googleAnalytics, logScreenName
> __See also__          [googleAnalytics.init()][plugin.googleAnalytics.init]
>						[googleAnalytics.logEvent()][plugin.googleAnalytics.logEvent]
>						[googleAnalytics.*][plugin.googleAnalytics]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Logs the screen name with Google Analytics.


## Syntax

	googleAnalytics.logScreenName( screenName )

##### screenName ~^(required)^~
_[String][api.type.String]._ The screen/scene name to log, for example `"main menu"`.


## Example

``````lua
local googleAnalytics = require( "plugin.googleAnalytics" )

-- Initialize Google Analytics
googleAnalytics.init( "CoronaApp1", "UA-12345678-90" )

-- Log screen name with Google Analytics
googleAnalytics.logScreenName( "main menu" )
``````
