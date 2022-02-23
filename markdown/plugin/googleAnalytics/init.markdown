# googleAnalytics.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Google Analytics, googleAnalytics, init
> __See also__          [googleAnalytics.logEvent()][plugin.googleAnalytics.logEvent]
>						[googleAnalytics.logScreenName()][plugin.googleAnalytics.logScreenName]
>						[googleAnalytics.*][plugin.googleAnalytics]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initalizes the Google Analytics plugin. This step is mandatory before any other features or methods can be used.


## Syntax

	googleAnalytics.init( appName, trackingID [, anonymizeIp] )

##### appName ~^(required)^~
_[String][api.type.String]._ The app name specified in the Google Analytics dashboard, ensuring that data sent from the app is categorized properly.

##### trackingID ~^(required)^~
_[String][api.type.String]._ The tracking ID for your account, obtained from the [Google Analytics](https://analytics.google.com) dashboard.

##### anonymizeIp ~^(optional)^~
_[Boolean][api.type.Boolean]._ Enabling anonymize IP functionality tells Google Analytics to anonymize the IP information sent by the SDK by removing the last octet of the IP address prior to its storage.


## Example

``````lua
local googleAnalytics = require( "plugin.googleAnalytics" )

-- Initialize Google Analytics
googleAnalytics.init( "CoronaApp1", "UA-12345678-90", true )
``````
