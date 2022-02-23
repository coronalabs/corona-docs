# steamworks.getAuthSessionTicket()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, getAuthSessionTicket, authentication
> __See also__          [authSessionTicketResponse][plugin.steamworks.event.authSessionTicketResponse]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns an authentication token produced by GetAuthSessionTicket required by many SDKs to connect to Steam API. Note, that while result is available immediately, Steam API documentation [suggests](https://partner.steamgames.com/doc/api/ISteamUser#GetAuthSessionTicket) to wait for the [authSessionTicketResponse][plugin.steamworks.event.authSessionTicketResponse] to make sure ticket is valid and can be used.


## Gotchas

Format or contents of this string is not specified in the documentation. It is not guaranteed to be a set of characters, it may be constant of random bytes.

## Syntax

	steamworks.getAuthSessionTicket( )


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

local ticketToken

local function onAuthTicketResponse(event)
	if event.isError then
		print("Error had occurred, code " .. event.resultCode)
		return
	end
	-- use the value of the ticketToken here
end

steamworks.addEventListener( "authSessionTicketResponse", onAuthTicketResponse )
ticketToken = steamworks.getAuthSessionTicket()

``````
