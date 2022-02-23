# googleAnalytics.logEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Google Analytics, googleAnalytics, logEvent
> __See also__          [googleAnalytics.init()][plugin.googleAnalytics.init]
>						[googleAnalytics.logScreenName()][plugin.googleAnalytics.logScreenName]
>						[googleAnalytics.*][plugin.googleAnalytics]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Logs an event with Google Analytics.


## Syntax

	googleAnalytics.logEvent( category, action [, label] [, value] )

##### category ~^(required)^~
_[String][api.type.String]._ String which identifies the group of objects to track, for example `"userAction"`.

##### action ~^(required)^~
_[String][api.type.String]._ A string which is uniquely paired with the category and is commonly used to define the type of user interaction, for instance `"button press"`.

##### label ~^(optional)^~
_[String][api.type.String]._ An optional string which provides additional dimensions to the event data, for example `"menu"` or `"quit"`.

##### value ~^(optional)^~
_[Number][api.type.Number]._ An optional integer which specifies the event value. Values must be <nobr>non-negative</nobr>.


## Example

``````lua
local googleAnalytics = require( "plugin.googleAnalytics" )

-- Initialize Google Analytics
googleAnalytics.init( "CoronaApp1", "UA-12345678-90" )

-- Log event with Google Analytics
googleAnalytics.logEvent( "userAction", "button press", "menuItem", 2 )
``````
