# event.count

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [activePlayerCount][plugin.steamworks.event.activePlayerCount]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, activePlayerCount, count
> __See also__          [activePlayerCount][plugin.steamworks.event.activePlayerCount]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Integer indicating the number of active players currently playing the game globally, excluding the currently logged in user.


## Gotchas

This property should be ignored if the [event.isError][plugin.steamworks.event.activePlayerCount.isError] property is `true`. This is typically the case if the system does not have Internet access.
