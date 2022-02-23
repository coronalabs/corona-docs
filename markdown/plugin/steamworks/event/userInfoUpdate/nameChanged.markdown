# event.nameChanged

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [userInfoUpdate][plugin.steamworks.event.userInfoUpdate]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, userInfoUpdate, nameChanged
> __See also__          [userInfoUpdate][plugin.steamworks.event.userInfoUpdate]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Boolean value of `true` if the user's profile name has changed since the last time this person's information was fetched from Steam. This will be `false` if unchanged.

If changed, the user's new name can be fetched using the [steamworks.getUserInfo()][plugin.steamworks.getUserInfo] function via the returned [UserInfo][plugin.steamworks.type.UserInfo] object's [name][plugin.steamworks.type.UserInfo.name] property.
