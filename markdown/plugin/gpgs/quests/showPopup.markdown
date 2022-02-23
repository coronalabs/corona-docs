# gpgs.quests.showPopup()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, quests, showPopup
> __See also__          [gpgs.quests][plugin.gpgs.quests]
>                       [gpgs.*][plugin.gpgs]
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

Displays a popup based on the current state of the quest.

## Gotchas

Popups are only displayed for quests that are accepted. If the quest is in any other state, no popup will be displayed, so you should call this upon the [accept][plugin.gpgs.quests.event.accept] event to show a popup.

## Syntax

	gpgs.quests.showPopup( questId )

##### questId ~^(required)^~
_[String][api.type.String]._ The quest to show a popup for.
