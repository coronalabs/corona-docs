# steamworks.requestUserProgress()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, requestUserProgress
> __See also__          [steamworks.getAchievementInfo()][plugin.steamworks.getAchievementInfo]
>                       [steamworks.getUserStatValue()][plugin.steamworks.getUserStatValue]
>                       [userProgressUpdate][plugin.steamworks.event.userProgressUpdate]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Asynchronously fetches game progression data such as achievements and stats for one user from Steam's server. If successful as indicated by the [userProgressUpdate][plugin.steamworks.event.userProgressUpdate] event's [isError][plugin.steamworks.event.userProgressUpdate.isError] property being set to `false`, the [steamworks.getAchievementInfo()][plugin.steamworks.getAchievementInfo] and [steamworks.getUserStatValue()][plugin.steamworks.getUserStatValue] functions will provide updated progression data for that user.

Returns `true` if the request was successfully sent to Steam. Note that this does not necessarily mean that the requested operation will succeed. For example, this function will return `true` if there is no Internet connection. So, a listener must check the [userProgressUpdate][plugin.steamworks.event.userProgressUpdate] event's [isError][plugin.steamworks.event.userProgressUpdate.isError] property as mentioned above.

Returns `false` if given invalid arguments or if the [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is also `false`.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

The Steam plugin will automatically fetch the currently logged in user's progression data on app startup. So, you will not normally call this function for the logged in user during gameplay to <nobr>re-fetch</nobr> their progression data. Instead, you will normally call this function for other users.

</div>


## Gotchas

If Internet is not available, then it may take over 1 minute for Steam to time-out and dispatch a [userProgressUpdate][plugin.steamworks.event.userProgressUpdate] event.


## Syntax

	steamworks.requestUserProgress( [userSteamId] )

##### userSteamId ~^(optional)^~
_[String][api.type.String]._ The unique string ID of the user. The ID will default to the current user if this argument is not provided.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Set the user ID of the friend to fetch progression data from
local friendSteamId = "FRIEND_ID"

-- Called when user achievement/stat data has been received
local function onUserProgressUpdated( event )
	if ( event.isError ) then
		-- Failed to receive updated progression data
	else
		-- User progression was successfully loaded
		-- You might want to reload achievement and stat data for user here
		if ( event.userSteamId == steamworks.userSteamId ) then
			-- The currently logged in user's progression data has been updated
		elseif ( event.userSteamId == friendSteamId ) then
			-- The friend's progression data has been updated
		end
	end
end

-- Set up a listener to be invoked when achievement and stat data has been updated
steamworks.addEventListener( "userProgressUpdate", onUserProgressUpdated )

-- Fetch the achievement and stat data from another user
steamworks.requestUserProgress( friendSteamId )
``````
