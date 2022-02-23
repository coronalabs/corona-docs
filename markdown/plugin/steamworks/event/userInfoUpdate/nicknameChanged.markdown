# event.nicknameChanged

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [userInfoUpdate][plugin.steamworks.event.userInfoUpdate]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, userInfoUpdate, nicknameChanged
> __See also__          [userInfoUpdate][plugin.steamworks.event.userInfoUpdate]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Boolean value of `true` if the user's nickname has changed since the last time this person's information was fetched from Steam. This will be `false` if unchanged.

If changed, the user's new nickname can be fetched using the [steamworks.getUserInfo()][plugin.steamworks.getUserInfo] function via the returned [UserInfo][plugin.steamworks.type.UserInfo] object's [nickname][plugin.steamworks.type.UserInfo.nickname] property.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

A nickname is applied by the currently logged in user to other users, such as friends. This is typically done in the Steam client or in the Steam overlay.

</div>
