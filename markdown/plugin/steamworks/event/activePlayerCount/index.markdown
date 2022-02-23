# activePlayerCount

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, activePlayerCount
> __See also__          [steamworks.requestActivePlayerCount()][plugin.steamworks.requestActivePlayerCount]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Event providing the number of players that are currently playing the game globally, excluding the currently logged in user.

This event can only be received by a [function][api.type.Function] callback that has been passed to the [steamworks.requestActivePlayerCount()][plugin.steamworks.requestActivePlayerCount] function.


## Properties

#### [event.count][plugin.steamworks.event.activePlayerCount.count]

#### [event.isError][plugin.steamworks.event.activePlayerCount.isError]

#### [event.name][plugin.steamworks.event.activePlayerCount.name]


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Called by the "steamworks.requestActivePlayerCount()" function with the result
local function onReceivedActivePlayerCount( event )
	if ( event.isError ) then
		-- Request failed; typically happens when there is no Internet access
		print( "Failed to fetch number of active players." )
	else
		-- Print the number of active players to the log
		print( "Number of people playing this game: " .. tostring(event.count) )
	end
end

-- Fetch the number of players currently playing this game
-- Requires an active Internet connection to succeed
-- Will provide the requested result to the given function
steamworks.requestActivePlayerCount( onReceivedActivePlayerCount )
``````
