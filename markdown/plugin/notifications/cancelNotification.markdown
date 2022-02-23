# notifications.cancelNotification()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			notification, notifications, cancelNotification
> __See also__			[Local/Push Notifications][guide.events.appNotification] _(guide)_
>						[notifications.scheduleNotification()][plugin.notifications.scheduleNotification]
>						[notifications.*][plugin.notifications]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Removes the specified notification (or&nbsp;all&nbsp;notifications) from the scheduler, status bar, and/or notification center.

## Syntax

	notifications.cancelNotification( [notificationId] )

##### notificationId ~^(optional)^~
A notification reference ID returned by [notifications.scheduleNotification()][plugin.notifications.scheduleNotification]. If no ID is passed, all notifications are cancelled.


## Example

``````lua
local notifications = require( "plugin.notifications" )

-- Schedule a notification
local options = {
	alert = "Wake up!"
}

local notificationId = notifications.scheduleNotification( 60, options )

-- Cancel the above notification
notifications.cancelNotification( notificationId )
``````
