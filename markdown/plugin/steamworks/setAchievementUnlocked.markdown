# steamworks.setAchievementUnlocked()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, achievements, setAchievementUnlocked
> __See also__          [steamworks.setAchievementProgress()][plugin.steamworks.setAchievementProgress]
>						[steamworks.setNotificationPosition()][plugin.steamworks.setNotificationPosition]
>                       [achievementInfoUpdate][plugin.steamworks.event.achievementInfoUpdate]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Unlocks the specified achievement for the current user. Unlocking an achievement will trigger a Steam notification popup.

Returns `true` if the achievement was successfully unlocked or was already unlocked.

Returns `false` if given invalid arguments or if the [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

You can control where Steam's notification popup will appear within the app by using the [steamworks.setNotificationPosition()][plugin.steamworks.setNotificationPosition] function.

</div>


## Syntax

	steamworks.setAchievementUnlocked( achievementName )

##### achievementName ~^(required)^~
_[String][api.type.String]._ On the Steamworks website, this is the unique name of the achievement set under the <nobr>__API Name Progress Stat__</nobr> column.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

steamworks.setAchievementUnlocked( "My Achievement Name" )
``````
