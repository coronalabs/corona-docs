# gpgs.clearNotifications()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, clearNotifications
> __Platforms__         Android
> __See also__          [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-android" style="font-size: 39px; padding-top: 1px;"></div>
</div>
<div class="docs-tip-inner-right">

This feature is currently only supported on Android.

</div>
</div>


## Overview

Clears all notifications, or clears specified types of notifications.

## Syntax

	gpgs.clearNotifications( [notificationTypes] )

##### notificationTypes ~^(optional)^~
_[Array][api.type.Array]._ Populate this array with [string][api.type.String] elements indicating the notification types to be cleared. Accepted values include `"all"`, `"multiplayer"`, `"invitation"`, <nobr>`"level up"`</nobr>, <nobr>`"match update"`</nobr>, `"quest"`, and `"request"`. If this array is omitted, all notifications will be cleared.
