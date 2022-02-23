# event.isError

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [userProgressSave][plugin.steamworks.event.userProgressSave]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, userProgressSave, isError
> __See also__          [userProgressSave][plugin.steamworks.event.userProgressSave]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Boolean value of `true` if Steam has failed to save and upload the user's recently unlocked achievements and/or updated stats to Steam's server. The [event.resultCode][plugin.steamworks.event.userProgressSave.resultCode] property will indicate why the failure occurred.

This will be `false` if user progression was successfully uploaded to Steam's server.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This property is normally set to `false` <nobr>(not a failure)</nobr> if the system does not have Internet access. The Steam client will typically cache the user's progression changes and attempt to automatically upload these cached changes later when Internet access becomes available again.

</div>
