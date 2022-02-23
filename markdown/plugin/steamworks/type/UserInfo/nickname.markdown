# object.nickname

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, getUserInfo, UserInfo, nickname
> __See also__          [steamworks.getUserInfo()][plugin.steamworks.getUserInfo]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A [string][api.type.String] providing a nickname assigned to a user by the currently logged in user. If the logged in user did not assign a nickname, this will be an empty string instead. It's usually preferable to display a user's nickname instead of their profile name, if available.

If the [UserInfo][plugin.steamworks.type.UserInfo] object references the currently logged in user, the nickname property will always be an empty string.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Set the user ID of the friend to fetch information for
local friendSteamId = "FRIEND_ID"

-- Function used to print the above friend's nickname to the log
local function fetchFriendInfo()
	local userInfo = steamworks.getUserInfo( friendSteamId )
	if ( userInfo ) then
		-- Friend's info was successfully fetched
		print( "Nickame: " .. userInfo.nickname )
	else
		-- Friend's info has not yet been fetched from Steam
	end
end

-- Attempt to fetch the friend's information now
-- This might fail on app startup if not cached by the Steam client
fetchFriendInfo()

-- Called when info about one user has been received or changed
local function onUserInfoUpdated( event )
	if ( event.userSteamId == friendSteamId ) then
		fetchFriendInfo()
	end
end

-- Set up a listener to be invoked when user info has been received or changed
steamworks.addEventListener( "userInfoUpdate", onUserInfoUpdated )
``````
