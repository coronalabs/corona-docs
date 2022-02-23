# object.relationship

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, getUserInfo, UserInfo, relationship
> __See also__          [steamworks.getUserInfo()][plugin.steamworks.getUserInfo]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A [string][api.type.String] indicating a user's relationship status with the currently logged in user.

This will be one of the following strings:

* `"blocked"`
* `"friend"`
* `"ignored"`
* `"ignoredFriend"`
* `"none"`
* `"requestRecipient"`
* `"requestInitiator"`
* `"suggested"`
* `"unknown"`


## Gotchas

If the [UserInfo][plugin.steamworks.type.UserInfo] object references the currently logged in user, this property will always be `"none"`.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Set the user ID of the friend to fetch information for
local friendSteamId = "FRIEND_ID"

-- Function used to print the above friend's relationship to the log
local function fetchFriendInfo()
	local userInfo = steamworks.getUserInfo( friendSteamId )
	if ( userInfo ) then
		-- Friend's info was successfully fetched
		print( "Relationship: " .. userInfo.relationship )
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
