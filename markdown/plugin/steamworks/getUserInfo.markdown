# steamworks.getUserInfo()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [UserInfo][plugin.steamworks.type.UserInfo]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, getUserInfo
> __See also__          [steamworks.addEventListener()][plugin.steamworks.addEventListener]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a [UserInfo][plugin.steamworks.type.UserInfo] object. This provides information about one user account such as the profile name, Steam level, online status, etc.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

When calling the [steamworks.requestLeaderboardEntries()][plugin.steamworks.requestLeaderboardEntries] function, user information for each leaderboard entry will be immediately available. Steam may also unload each entry's user information automatically. So, this information should be fetched immediately when it becomes available.

</div>


## Gotchas

This function will return `nil` in the following cases:

* An invalid user ID was specified.
* The ID of another user was specified <nobr>(not the current user)</nobr> but the information has not yet been downloaded or it's no longer cached. In this case, the requested information will automatically be downloaded from the Steam server. The result of this request will then be provided by the [userInfoUpdate][plugin.steamworks.event.userInfoUpdate] event which can be received by a listener given to the [steamworks.addEventListener()][plugin.steamworks.addEventListener] function.
* The [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`, indicating that the application is not currently connected to the Steam client.


## Syntax

	steamworks.getUserInfo( [userSteamId] )

##### userSteamId ~^(optional)^~
_[String][api.type.String]._ The unique string ID of the user. The ID will default to the current user if this argument is not provided.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Called when information about one user has been received or changed
local function onUserInfoUpdated( event )
	-- Print information about the user
	local userInfo = steamworks.getUserInfo( event.userSteamId )
	if ( userInfo ) then
		print( "User Name: " .. userInfo.name )
		print( "User Nickname: " .. userInfo.nickname )
		print( "Steam Level: " .. tostring(userInfo.steamLevel) )
		print( "Status: " .. userInfo.status )
		print( "Relationship: " .. userInfo.relationship )
	end
end

-- Set up a listener to be invoked when user info has been received or changed
steamworks.addEventListener( "userInfoUpdate", onUserInfoUpdated )
``````
