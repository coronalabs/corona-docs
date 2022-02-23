# userInfoUpdate

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, userInfoUpdate
> __See also__          [steamworks.addEventListener()][plugin.steamworks.addEventListener]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event occurs when new information has been received for one user. This event also provides flags indicating which aspect of the user's information has changed during gameplay.

When calling the [steamworks.requestLeaderboardEntries()][plugin.steamworks.requestLeaderboardEntries] function, Steam will automatically fetch user information and dispatch these events for each requested entry. This way, user information for each leaderboard entry will be immediately available to you by calling the [steamworks.getUserInfo()][plugin.steamworks.getUserInfo] function.

Also, if you call the [steamworks.getUserInfo()][plugin.steamworks.getUserInfo] function and it returns `nil`, Steam will automatically fetch that user's information asynchronously&nbsp;&mdash; assuming it was given a valid user&nbsp;ID&nbsp;&mdash; and dispatch this event when that information becomes available. After receiving this event, you can call the [steamworks.getUserInfo()][plugin.steamworks.getUserInfo] function again to acquire that user's information.

You can receive these events by adding a [listener][api.type.Listener] to the plugin via the [steamworks.addEventListener()][plugin.steamworks.addEventListener] function.


## Properties

#### [event.facebookInfoChanged][plugin.steamworks.event.userInfoUpdate.facebookInfoChanged]

#### [event.largeAvatarChanged][plugin.steamworks.event.userInfoUpdate.largeAvatarChanged]

#### [event.mediumAvatarChanged][plugin.steamworks.event.userInfoUpdate.mediumAvatarChanged]

#### [event.name][plugin.steamworks.event.userInfoUpdate.name]

#### [event.nameChanged][plugin.steamworks.event.userInfoUpdate.nameChanged]

#### [event.nicknameChanged][plugin.steamworks.event.userInfoUpdate.nicknameChanged]

#### [event.relationshipChanged][plugin.steamworks.event.userInfoUpdate.relationshipChanged]

#### [event.smallAvatarChanged][plugin.steamworks.event.userInfoUpdate.smallAvatarChanged]

#### [event.statusChanged][plugin.steamworks.event.userInfoUpdate.statusChanged]

#### [event.steamLevelChanged][plugin.steamworks.event.userInfoUpdate.steamLevelChanged]

#### [event.userSteamId][plugin.steamworks.event.userInfoUpdate.userSteamId]


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Called when info about one user has been received or changed
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

	-- Print which aspects of the user info has changed
	print( "Has Name Changed: " .. tostring(event.nameChanged) )
	print( "Has Nickname Changed: " .. tostring(event.nicknameChanged) )
	print( "Has Steam Level Changed: " .. tostring(event.steamLevelChanged) )
	print( "Has Status Changed: " .. tostring(event.statusChanged) )
	print( "Has Relationship Changed: " .. tostring(event.relationshipChanged) )
	print( "Has Facebook Info Changed: " .. tostring(event.facebookInfoChanged) )
	print( "Has Small Avatar Changed: " .. tostring(event.smallAvatarChanged) )
	print( "Has Medium Avatar Changed: " .. tostring(event.mediumAvatarChanged) )
	print( "Has Large Avatar Changed: " .. tostring(event.largeAvatarChanged) )
end

-- Set up a listener to be invoked when user info has been received or changed
steamworks.addEventListener( "userInfoUpdate", onUserInfoUpdated )
``````
