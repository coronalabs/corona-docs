# event.leaderboardHandle

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [setHighScore][plugin.steamworks.event.setHighScore]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, leaderboard, setHighScore, leaderboardHandle
> __See also__          [setHighScore][plugin.steamworks.event.setHighScore]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The unique ID in [string][api.type.String] form that was assigned to the leaderboard by Steam. This is provided for informational purposes only.


## Gotchas

* This will be `"0"` if the [event.isError][plugin.steamworks.event.setHighScore.isError] property is `true`.

* This ID is a 64-bit unsigned integer stored as a [string][api.type.String] in Lua. You should __not__ convert this to a [number][api.type.Number] in Lua because [number][api.type.Number] stores values as a <nobr>double-precision</nobr> float which can only have 15&nbsp;digits of precision. A <nobr>64-bit</nobr> unsigned integer can have 20&nbsp;digits, so converting this to a [number][api.type.Number] can cause the trailing digits to be lost.
