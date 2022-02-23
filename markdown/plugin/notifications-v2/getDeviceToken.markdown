# notifications.getDeviceToken()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		[String][api.type.String]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			notification, notifications, subscribe
> __See also__			[notifications.*][plugin.notifications-v2]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the Firebase device token currently assigned to the device.


## Syntax

	notifications.getDeviceToken()


## Example

``````lua
local notifications = require( "plugin.notifications.v2" )

print( notifications.getDeviceToken() )
``````
