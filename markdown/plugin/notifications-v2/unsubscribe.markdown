# notifications.unsubscribe()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			notification, notifications, unsubscribe
> __See also__			[notifications.subscribe()][plugin.notifications-v2.subscribe]
>						[notifications.*][plugin.notifications-v2]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Unsubscribe from a specific topic.


## Syntax

	notifications.unsubscribe( topic )

##### topic ~^(required)^~
_[String][api.type.String]._ The topic to unsubscribe from.


## Example

``````lua
local notifications = require( "plugin.notifications.v2" )

notifications.subscribe( "news" )

-- Sometime later, unsubscribe from the topic
notifications.unsubscribe( "news" )
``````
