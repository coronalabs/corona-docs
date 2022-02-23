# event.isError

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [activePlayerCount][plugin.steamworks.event.activePlayerCount]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, activePlayerCount, isError
> __See also__          [activePlayerCount][plugin.steamworks.event.activePlayerCount]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns `true` if the request failed. This is typically the case if the system does not have Internet access. The [event.count][plugin.steamworks.event.activePlayerCount.count] property should be ignored in this instance.

Returns `false` if the request was successful. The [event.count][plugin.steamworks.event.activePlayerCount.count] property will provide the number of players that are currently playing the game globally, excluding the currently logged in user.
