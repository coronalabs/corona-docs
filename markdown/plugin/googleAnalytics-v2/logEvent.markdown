# googleAnalytics.logEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Google Analytics, Google Analytics v2, googleAnalytics, googleAnalytics v2, googleAnalytics, logEvent
> __See also__          [googleAnalytics.init()][plugin.googleAnalytics-v2.init]
>						[googleAnalytics.logScreenName()][plugin.googleAnalytics-v2.logScreenName]
>						[googleAnalytics.*][plugin.googleAnalytics-v2]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Logs an event with Google Analytics.


## Syntax

	googleAnalytics.logEvent( eventName, parameters )

##### eventName ~^(required)^~
_[String][api.type.String]._ String which identifies the group of objects to track, for example `"share_image"`.

##### parameters ~^(required)^~
_[Table][api.type.Table]._ A table of key value pairs that are added to event, for example  `"{imageType = "png", id=321}"`.


## Syntax (Legacy)

	googleAnalytics.logEvent( eventName, action [, label] [, value] )

##### eventName ~^(required)^~
_[String][api.type.String]._ String which identifies the group of objects to track, for example `"share_image"`.

##### action ~^(required)^~
_[String][api.type.String]._ A string which is uniquely paired with the event as a parameter `"button_press"`.

##### label ~^(optional)^~
_[String][api.type.String]._ An optional string which is uniquely paired with the event as a parameter `"menu"` or `"quit"`.

##### value ~^(optional)^~
_[Number][api.type.Number]._ An optional integer which specifies the event value. Values must be <nobr>non-negative</nobr>.


## Example

``````lua
local googleAnalytics = require( "plugin.googleAnalytics" )

-- Initialize Google Analytics
googleAnalytics.init()

-- Log event with Google Analytics
googleAnalytics.logEvent( "share_image", {imageType = "png", id=321} )

-- Legacy Log event with Google Analytics
googleAnalytics.logEvent( "user_action", "button_press", "menu_item", 2 )
``````
