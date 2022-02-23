# event.mediumAvatarChanged

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [userInfoUpdate][plugin.steamworks.event.userInfoUpdate]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, userInfoUpdate, mediumAvatarChanged
> __See also__          [userInfoUpdate][plugin.steamworks.event.userInfoUpdate]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Boolean value of `true` if the user's medium avatar image has changed since the last time this person's information was fetched from Steam. This means that a call to the [steamworks.getUserImageInfo()][plugin.steamworks.getUserImageInfo] function given a `"mediumAvatar"` image type will return an [ImageInfo.imageHandle][plugin.steamworks.type.ImageInfo.imageHandle] referencing a new image.

This will be `false` if the medium avatar image has not changed.
