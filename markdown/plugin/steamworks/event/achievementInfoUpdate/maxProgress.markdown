# event.maxProgress

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [achievementInfoUpdate][plugin.steamworks.event.achievementInfoUpdate]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, achievements, achievementInfoUpdate, maxProgress
> __See also__          [achievementInfoUpdate][plugin.steamworks.event.achievementInfoUpdate]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Number indicating the maximum progress towards unlocking an achievement. Only applicable if the [steamworks.setAchievementProgress()][plugin.steamworks.setAchievementProgress] function has been called. Intended to be compared with the [event.currentProgress][plugin.steamworks.event.achievementInfoUpdate.currentProgress] property.

In order to calculate a percentage complete, you must divide the [event.currentProgress][plugin.steamworks.event.achievementInfoUpdate.currentProgress] property by this property.


## Gotchas

* This will be `nil` if the [steamworks.setAchievementProgress()][plugin.steamworks.setAchievementProgress] function has never been called or if the achievement has been unlocked.

* Steam does not save the current progress of an achievement. It only saves an achievement's lock/unlock status. This event property and the [steamworks.setAchievementProgress()][plugin.steamworks.setAchievementProgress] function is mostly intended for displaying a popup notification to the user for visualization purposes.
