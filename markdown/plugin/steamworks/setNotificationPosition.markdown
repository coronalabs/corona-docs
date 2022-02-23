# steamworks.setNotificationPosition()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, setNotificationPosition
> __See also__          [steamworks.setAchievementProgress()][plugin.steamworks.setAchievementProgress]
>						[steamworks.setAchievementUnlocked()][plugin.steamworks.setAchievementUnlocked]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets where Steam's notification popups will appear within the application window. Steam notification popups appear when achievements have been unlocked, when friends appear online, etc. It is recommended to position notifications in a corner of the application window that won't cover up vital gameplay content. This position can be changed dynamically during the lifetime of the application, such as after scene changes.

Returns `true` if the notification position was successfully assigned.

Returns `false` if given invalid arguments or if the [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`.


## Gotchas

* Notification popups won't appear in the app if the [steamworks.canShowOverlay][plugin.steamworks.canShowOverlay] property is `false`.

* Notification popup position always defaults to the <nobr>bottom-right</nobr> corner on application startup.

* Steam will not store or remember the last assigned notification position after the application exits.


## Syntax

	steamworks.setNotificationPosition( positionName )

##### positionName ~^(required)^~
_[String][api.type.String]._ Indicates where within the application window notification popups should appear. Must be set to one of the following:

* `"topLeft"`
* `"topRight"`
* `"bottomLeft"`
* `"bottomRight"`


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

steamworks.setNotificationPosition( "topRight" )
``````
