# steamworks.resetUserProgress()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, achievements, resetUserProgress
> __See also__          [steamworks.resetUserStats()][plugin.steamworks.resetUserStats]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Clears all stat data to `nil` and <nobr>re-locks</nobr> all unlocked achievements for the current user. This does __not__ clear the user's high scores from leaderboards.

Returns `true` if the reset request was successfully accepted by Steam.

Returns `false` if the [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Calling this function is typically only appropriate for testing purposes, as most players would __not__ expect to lose their unlocked achievements. If you want to provide an option for users to clear only their stat data, consider using the [steamworks.resetUserStats()][plugin.steamworks.resetUserStats] function instead.

</div>
</div>


## Gotchas

* This does __not__ clear the user's high scores from leaderboards.

* The [userProgressUpdate][plugin.steamworks.event.userProgressUpdate] event will not be dispatched after calling this function.


## Syntax

	steamworks.resetUserProgress()


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Clear all stat data and lock all achievements for the currently logged in user
steamworks.resetUserProgress()
``````
