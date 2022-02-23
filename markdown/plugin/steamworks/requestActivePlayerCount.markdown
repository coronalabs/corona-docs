# steamworks.requestActivePlayerCount()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, requestActivePlayerCount
> __See also__          [activePlayerCount][plugin.steamworks.event.activePlayerCount]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Asynchronously fetches the number of people running the application globally from Steam's server, not counting the currently logged in user.

Returns `true` if the request was successfully sent to Steam. Note that this does not necessarily mean that the requested operation will succeed. For example, this function will return `true` if there is no Internet connection. So, the listener must check the received [event.isError][plugin.steamworks.event.activePlayerCount.isError] property to determine if the requested operation succeeded.

Returns `false` if given invalid arguments or if the [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`.


## Syntax

	steamworks.requestActivePlayerCount( listener )

##### listener ~^(required)^~
_[Function][api.type.Function]._ Function which will receive the result of the request via an [activePlayerCount][plugin.steamworks.event.activePlayerCount] event.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Fetch the number of people currently playing this game
local function onReceivedActivePlayerCount( event )
	if ( event.isError ) then
		-- This will likely happen due to lack of Internet access
		print( "Failed to fetch active player count." )
	else
		-- Print current number of people playing this game
		print( "Active Player Count: " .. tostring(event.count) )
	end
end
steamworks.requestActivePlayerCount( onReceivedActivePlayerCount )
``````
