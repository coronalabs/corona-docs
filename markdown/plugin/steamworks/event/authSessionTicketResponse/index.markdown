# authSessionTicketResponse

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, authSessionTicketResponse
> __See also__          [steamworks.addEventListener()][plugin.steamworks.addEventListener]
>                       [steamworks.requestUserProgress()][plugin.steamworks.requestUserProgress]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event occurs after successful [steamworks.getAuthSessionTicket()][plugin.steamworks.getAuthSessionTicket] call. Steam documentation suggests to wait for this event before using the Authorization Ticket, to make sure user is online and ticket would be valid.


## Properties

#### [event.isError][plugin.steamworks.event.authSessionTicketResponse.isError]

#### [event.name][plugin.steamworks.event.authSessionTicketResponse.name]

#### [event.resultCode][plugin.steamworks.event.authSessionTicketResponse.resultCode]

