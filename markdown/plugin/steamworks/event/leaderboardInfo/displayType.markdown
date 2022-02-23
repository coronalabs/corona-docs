# event.displayType

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [leaderboardInfo][plugin.steamworks.event.leaderboardInfo]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, leaderboardInfo, displayType
> __See also__          [leaderboardInfo][plugin.steamworks.event.leaderboardInfo]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

String ID indicating the type of values/scores that the leaderboard contains. On the Steamworks website, this matches the leaderboard setting under the __Display&nbsp;Type__ column.

This property will be one of the following strings:

* `"numeric"`
* `"seconds"`
* `"milliseconds"`
* `"none"` (can only be returned by <nobr>programmatically-created</nobr> leaderboards)
* `"unknown"` (indicates the plugin failed to identify the display type)


## Gotchas

This property will be `nil` if the [event.isError][plugin.steamworks.event.leaderboardInfo.isError] property is `true`.
