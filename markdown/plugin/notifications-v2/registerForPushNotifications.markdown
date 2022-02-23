# notifications.registerForPushNotifications()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			notification, notifications, registerForPushNotifications
> __See also__			[notifications.*][plugin.notifications-v2]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Register for push notifications on iOS. This will show the popup which asks the user if they want to enable push notifications. After the first call, subsequent calls will not show the popup again.


## Gotchas

This function does nothing on Android.


## Syntax

	notifications.registerForPushNotifications( [params] )

##### params ~^(optional)^~
_[Table][api.type.Table]._ Optional table containing registration parameters &mdash; see the next section for details.


## Parameter Reference

The `params` table includes additional parameters for notification registration.

##### useFCM ~^(optional)^~
_[Boolean][api.type.Boolean]._ If you're using Google <nobr>[Firebase](https://firebase.google.com/) Cloud Messaging (FCM)</nobr>, include this key with a value of `true`.


## Examples

##### Default

``````lua
local notifications = require( "plugin.notifications.v2" )

notifications.registerForPushNotifications()
``````

##### Firebase (FCM)

``````lua
local notifications = require( "plugin.notifications.v2" )

notifications.registerForPushNotifications( { useFCM=true } )
``````
