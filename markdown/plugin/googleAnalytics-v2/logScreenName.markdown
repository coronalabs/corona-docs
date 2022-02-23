# googleAnalytics.logScreenName()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Google Analytics, Google Analytics v2, googleAnalytics, googleAnalytics v2, logScreenName
> __See also__          [googleAnalytics.init()][plugin.googleAnalytics-v2.init]
>						[googleAnalytics.logEvent()][plugin.googleAnalytics-v2.logEvent]
>						[googleAnalytics.*][plugin.googleAnalytics-v2]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Logs the screen name with Google Analytics.


## Syntax

	googleAnalytics.logScreenName( screenName )

##### screenName ~^(required)^~
_[String][api.type.String]._ The screen/scene name to log, for example `"main_menu"`.


## Example

``````lua
local googleAnalytics = require( "plugin.googleAnalytics" )

-- Initialize Google Analytics
googleAnalytics.init( )

-- Log screen name with Google Analytics
googleAnalytics.logScreenName( "main_menu" )
``````
