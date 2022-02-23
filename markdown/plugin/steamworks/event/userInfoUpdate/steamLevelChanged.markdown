# event.steamLevelChanged

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [userInfoUpdate][plugin.steamworks.event.userInfoUpdate]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, userInfoUpdate, steamLevelChanged
> __See also__          [userInfoUpdate][plugin.steamworks.event.userInfoUpdate]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Boolean value of `true` if the user's numeric Steam level has changed since the last time this person's information was fetched from Steam. This will be `false` if unchanged.

If changed, the user's updated Steam level can be fetched using the [steamworks.getUserInfo()][plugin.steamworks.getUserInfo] function via the returned [UserInfo][plugin.steamworks.type.UserInfo] object's [steamLevel][plugin.steamworks.type.UserInfo.steamLevel] property.
