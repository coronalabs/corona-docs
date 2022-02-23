# notifications.registerForPushNotifications()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			notification, notifications, registerForPushNotifications
> __See also__			[Local/Push Notifications][guide.events.appNotification] _(guide)_
>						[notifications.scheduleNotification()][plugin.notifications.scheduleNotification]
>						[notifications.*][plugin.notifications]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Register for push notifications on iOS. This will show the popup which asks the user if they want to enable push notifications. After the first call, subsequent calls will not show the popup again.


## Gotchas

This function does nothing on Android.


## Syntax

	notifications.registerForPushNotifications()


## Example

``````lua
local notifications = require( "plugin.notifications" )

notifications.registerForPushNotifications()
``````
