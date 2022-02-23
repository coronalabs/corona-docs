# steamworks.appOwnerSteamId

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, appOwnerSteamId
> __See also__          [steamworks.userSteamId][plugin.steamworks.userSteamId]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The unique string ID of the user that purchased the application. This property will typically match the [steamworks.userSteamId][plugin.steamworks.userSteamId] property unless the purchaser has logged out of the Steam client and has let someone else log in on the same machine.


## Gotchas

This will be `nil` if the [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`, indicating the application is not currently connected to the Steam client.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

print( "App Owner ID: " .. tostring(steamworks.appOwnerSteamId) )
``````
