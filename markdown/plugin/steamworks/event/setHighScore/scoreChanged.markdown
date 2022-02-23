# event.scoreChanged

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [setHighScore][plugin.steamworks.event.setHighScore]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, setHighScore, scoreChanged
> __See also__          [setHighScore][plugin.steamworks.event.setHighScore]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Boolean value of `true` if the user's score was successfully changed and updated on the leaderboard. The [event.currentGlobalRank][plugin.steamworks.event.setHighScore.currentGlobalRank] property will then provide the user's current global rank on the leaderboard as well.

This will be `false` if the score submitted to the [steamworks.requestSetHighScore()][plugin.steamworks.requestSetHighScore] function was less than or equal to the user's previous score, or if the [event.isError][plugin.steamworks.event.setHighScore.isError] property is `true`, indicating that the request failed to reach Steam's server.
