# event.relationshipChanged

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [userInfoUpdate][plugin.steamworks.event.userInfoUpdate]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, userInfoUpdate, relationshipChanged
> __See also__          [userInfoUpdate][plugin.steamworks.event.userInfoUpdate]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Boolean value of `true` if the user's relationship status with the currently logged in user has changed since the last time this person's information was fetched from Steam. This will be `false` if unchanged.

If changed, the user's updated relationship status can be fetched using the [steamworks.getUserInfo()][plugin.steamworks.getUserInfo] function via the returned [UserInfo][plugin.steamworks.type.UserInfo] object's [relationship][plugin.steamworks.type.UserInfo.relationship] property.
