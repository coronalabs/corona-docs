# steamworks.setAchievementProgress()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, achievements, setAchievementProgress
> __See also__          [steamworks.setAchievementUnlocked()][plugin.steamworks.setAchievementUnlocked]
>                       [achievementInfoUpdate][plugin.steamworks.event.achievementInfoUpdate]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the amount of progress made towards one achievement for the current user. This is mostly intended for display purposes. Calling this function will trigger a Steam notification popup to be displayed to the user, indicating their current progress, but only if overlays are enabled by the user in the Steam client. If the given progress `value` argument is greater than or equal to the given `maxValue` argument, the achievement will be automatically unlocked.

Returns `true` if achievement progression was successfully updated.

Returns `false` if given invalid arguments or if the [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

You can control where Steam's notification popup will appear within the app by using the [steamworks.setNotificationPosition()][plugin.steamworks.setNotificationPosition] function.

</div>


## Gotchas

Steam does not save the amount of progress made towards an achievement. Steam only saves an achievement's lock/unlock status. This means that it's up to the application developer to track and store this amount outside of Steam, such as to file, until it has been unlocked.


## Syntax

	steamworks.setAchievementProgress( achievementName, value, maxValue )

##### achievementName ~^(required)^~
_[String][api.type.String]._ On the Steamworks website, this is the unique name of the achievement set under the <nobr>__API Name Progress Stat__</nobr> column.

##### value ~^(required)^~
_[Number][api.type.Number]._ Integer indicating the current progress made towards the achievement, ranging between `0` and the `maxValue` argument.

##### maxValue ~^(required)^~
_[Number][api.type.Number]._ Integer defining the maximum progression value until the achievement will be unlocked.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Set the achievement progress to "50/100"
steamworks.setAchievementProgress( "My Achievement Name", 50, 100 )
``````
