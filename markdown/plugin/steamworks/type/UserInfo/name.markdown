# object.name

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, getUserInfo, UserInfo, name
> __See also__          [steamworks.getUserInfo()][plugin.steamworks.getUserInfo]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A [string][api.type.String] providing the Steam user's profile name. This is the public name that other Steam users can see.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Print the currently logged in user's name
local userInfo = steamworks.getUserInfo()

if ( userInfo ) then
	print( "User Profile Name: " .. userInfo.name )
end
``````
