# event.isError

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [userProgressUpdate][plugin.steamworks.event.userProgressUpdate]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, userProgressUpdate, isError
> __See also__          [userProgressUpdate][plugin.steamworks.event.userProgressUpdate]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Boolean value of `true` if Steam has failed to fetch the user's achievements and stat data. The [event.resultCode][plugin.steamworks.event.userProgressUpdate.resultCode] property will indicate why the failure occurred.

This will be `false` if user progression was successfully fetched and loaded. This means that the [steamworks.getAchievementInfo()][plugin.steamworks.getAchievementInfo] and [steamworks.getUserStatValue()][plugin.steamworks.getUserStatValue] functions will provide updated progression information for the user identified by the [event.userSteamId][plugin.steamworks.event.userProgressUpdate.userSteamId] property.
