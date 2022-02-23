# event.entries

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Array][api.type.Array]
> __Event__             [leaderboardEntries][plugin.steamworks.event.leaderboardEntries]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, leaderboardEntries, entries
> __See also__          [leaderboardEntries][plugin.steamworks.event.leaderboardEntries]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns an array of [tables][api.type.Table], where each table provides the following information about one entry in a leaderboard:

* `userSteamId` &mdash; Unique [string][api.type.String] ID of the user who the leaderboard entry score belongs to. More information about this user can be fetched via the [steamworks.getUserInfo()][plugin.steamworks.getUserInfo] function.
* `globalRank` &mdash; An integer providing the numeric rank of the user globally, where `1` is the highest rank.
* `score` &mdash; An integer providing the user's score on the leaderboard.


## Gotchas

The returned array will be empty if the leaderboard is empty, if the requested entry range is out of bounds, or if [event.isError][plugin.steamworks.event.leaderboardEntries.isError] is `true`.
