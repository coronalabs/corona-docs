# steamworks.userSteamId

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, userSteamId
> __See also__          [steamworks.appOwnerSteamId][plugin.steamworks.appOwnerSteamId]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The unique string ID of the user currently logged into the Steam client.


## Gotchas

This will be `nil` if the [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`, indicating the application is not currently connected to the Steam client. It will also be `nil` if a valid `appId` was not set in `config.lua` as documented [here][plugin.steamworks].


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

print( "Steam App ID: " .. tostring(steamworks.userSteamId) )
``````
