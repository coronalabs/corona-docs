# notifications.subscribe()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			notification, notifications, subscribe
> __See also__			[notifications.unsubscribe()][plugin.notifications-v2.unsubscribe]
>						[notifications.*][plugin.notifications-v2]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Subscribe to a specific topic to receive notifications for it.


## Syntax

	notifications.subscribe( topic )

##### topic ~^(required)^~
_[String][api.type.String]._ The topic to subscribe to.


## Example

``````lua
local notifications = require( "plugin.notifications.v2" )

notifications.subscribe( "news" )
``````
