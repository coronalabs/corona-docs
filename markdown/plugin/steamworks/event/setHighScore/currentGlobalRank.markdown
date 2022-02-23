# event.currentGlobalRank

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [setHighScore][plugin.steamworks.event.setHighScore]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, setHighScore, currentGlobalRank
> __See also__          [setHighScore][plugin.steamworks.event.setHighScore]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Integer indicating the user's new global rank on the leaderboard where `1` is the highest rank.

This will be `nil` if the [event.scoreChanged][plugin.steamworks.event.setHighScore.scoreChanged] property is `false`, indicating that the user's score and rank has not changed.
