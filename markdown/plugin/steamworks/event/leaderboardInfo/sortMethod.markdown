# event.sortMethod

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [leaderboardInfo][plugin.steamworks.event.leaderboardInfo]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, leaderboardInfo, sortMethod
> __See also__          [leaderboardInfo][plugin.steamworks.event.leaderboardInfo]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

String ID indicating the sort order of the values/scores on the leaderboard. On the Steamworks website, this matches the leaderboard setting under the __Sort&nbsp;Method__ column.

This property will be one of the following strings:

* `"ascending"`
* `"descending"`
* `"none"` (can only be returned by <nobr>programmatically-created</nobr> leaderboards)
* `"unknown"` (indicates the plugin failed to identify the sort method)


## Gotchas

This property will be `nil` if the [event.isError][plugin.steamworks.event.leaderboardInfo.isError] property is `true`.
