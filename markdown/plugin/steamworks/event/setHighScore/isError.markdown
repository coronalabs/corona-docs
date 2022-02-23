# event.isError

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [setHighScore][plugin.steamworks.event.setHighScore]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, setHighScore, isError
> __See also__          [setHighScore][plugin.steamworks.event.setHighScore]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Boolean value of `true` if the request failed. This is typically the case if the system does not have Internet access or if an invalid leaderboard name was given.

This will be `false` if the request was successfully received by Steam's server. This does not necessarily mean that the leaderboard score was changed&nbsp;&mdash; it could simply be less than or equal to the user's previous score. The [event.scoreChanged][plugin.steamworks.event.setHighScore.scoreChanged] property will indicate if the score has changed or not.
