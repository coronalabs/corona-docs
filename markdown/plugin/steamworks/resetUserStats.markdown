# steamworks.resetUserStats()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, achievements, resetUserStats
> __See also__          [steamworks.resetUserProgress()][plugin.steamworks.resetUserProgress]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Clears all stat data to `nil` for the current user. This means that all calls to the [steamworks.getUserStatValue()][plugin.steamworks.getUserStatValue] function will return `nil` until you've set new stat data for the current user.

Returns `true` if the reset request was successfully accepted by Steam.

Returns `false` if the [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`.


## Gotchas

The [userProgressUpdate][plugin.steamworks.event.userProgressUpdate] event will not be dispatched after calling this function.


## Syntax

	steamworks.resetUserStats()


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Clear all stat data for the currently logged in user
steamworks.resetUserStats()
``````
