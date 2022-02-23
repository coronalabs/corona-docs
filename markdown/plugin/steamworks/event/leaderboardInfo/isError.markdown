# event.isError

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [leaderboardInfo][plugin.steamworks.event.leaderboardInfo]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, leaderboardInfo, isError
> __See also__          [leaderboardInfo][plugin.steamworks.event.leaderboardInfo]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Boolean value of `true` if the request failed. This is typically the case if the system does not have Internet access. All other event properties, except for [event.name][plugin.steamworks.event.leaderboardInfo.name] and [event.leaderboardName][plugin.steamworks.event.leaderboardInfo.leaderboardName], will be `nil` and should be ignored.

This will be `false` if the request was successful.
