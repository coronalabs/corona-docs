# object.steamLevel

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, getUserInfo, UserInfo, steamLevel
> __See also__          [steamworks.getUserInfo()][plugin.steamworks.getUserInfo]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

An integer indicating a user's current level on Steam as seen under their profile screen. This __Level__ number starts at `1` and increases when the user purchases games, trades Steam cards, crafts Steam badges, etc. 


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Print the currently logged in user's current steam level
local userInfo = steamworks.getUserInfo()

if ( userInfo ) then
	print( "User's Steam Level: " .. tostring( userInfo.steamLevel ) )
end
``````
