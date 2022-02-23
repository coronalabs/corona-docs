# event.isError

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [leaderboardEntries][plugin.steamworks.event.leaderboardEntries]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, leaderboardEntries, isError
> __See also__          [leaderboardEntries][plugin.steamworks.event.leaderboardEntries]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Boolean value of `true` if the request failed. This is typically the case if the system does not have Internet access. In this instance, the [event.entries][plugin.steamworks.event.leaderboardEntries.entries] property will be an empty array and should be ignored.

This will be `false` if the request was successful. The [event.entries][plugin.steamworks.event.leaderboardEntries.entries] property can then provide the entries requested from the leaderboard.
