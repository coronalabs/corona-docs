# event.previousGlobalRank

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [setHighScore][plugin.steamworks.event.setHighScore]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, setHighScore, previousGlobalRank
> __See also__          [setHighScore][plugin.steamworks.event.setHighScore]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns an integer indicating the user's previous global rank on the leaderboard after a call to the [steamworks.requestSetHighScore()][plugin.steamworks.requestSetHighScore] has successfully changed the user's score.

Returns `nil` if the [event.scoreChanged][plugin.steamworks.event.setHighScore.scoreChanged] property is `false`, indicating that the user's score and rank has not changed.
