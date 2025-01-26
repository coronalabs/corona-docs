# notifications.areNotificationsEnabled()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			notification, notifications, areNotificationsEnabled
> __See also__			[notifications.*][plugin.notifications-v2]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Checks whether push notifications are enabled for the app on the device. Works for iOS and Android.
Returns true if notifications are enabled, false otherwise.

## Syntax

	notifications.areNotificationsEnabled()

## Example

``````lua
local notifications = require( "plugin.notifications.v2" )

local enabled = notifications.areNotificationsEnabled()
``````