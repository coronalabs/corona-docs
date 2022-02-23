# steamworks.appId

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, appId
> __See also__          [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Fetches the unique string ID assigned to the application by Steam.


## Gotchas

This property will be `nil` if a valid `appId` was not set in `config.lua` as documented [here][plugin.steamworks].


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

print( "Steam App ID: " .. tostring(steamworks.appId) )
``````
