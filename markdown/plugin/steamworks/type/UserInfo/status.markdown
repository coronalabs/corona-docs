# object.status

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, getUserInfo, UserInfo, status
> __See also__          [steamworks.getUserInfo()][plugin.steamworks.getUserInfo]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A [string][api.type.String] indicating a user's current online status. This is a setting that a user can set under the Steam client's __Friends__ menu.

This will be one of the following strings:

* `"away"`
* `"busy"`
* `"lookingToPlay"`
* `"lookingToTrade"`
* `"offline"`
* `"online"`
* `"snooze"`
* `"unknown"`


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Print the currently logged in user's current online status
local userInfo = steamworks.getUserInfo()

if ( userInfo ) then
	print( "User Status: " .. userInfo.status )
end
``````
