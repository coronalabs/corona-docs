# event.orderId

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [microtransactionAuthorization][plugin.steamworks.event.microtransactionAuthorization]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, IAP, in-app purchases, microtransaction, microtransactionAuthorization, orderId
> __See also__          [microtransactionAuthorization][plugin.steamworks.event.microtransactionAuthorization]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The unique order ID in [string][api.type.String] form that was assigned to the microtransaction. This order&nbsp;ID is assigned by the app developer when issuing a microtransaction request via Steam's web APIs. It is up to the app developer to manage order&nbsp;IDs.


## Gotchas

This ID is a 64-bit unsigned integer stored as a [string][api.type.String] in Lua. You should __not__ convert this to a [number][api.type.Number] in Lua because [number][api.type.Number] stores values as a <nobr>double-precision</nobr> float which can only have 15&nbsp;digits of precision. A <nobr>64-bit</nobr> unsigned integer can have 20&nbsp;digits, so converting this to a [number][api.type.Number] can cause the trailing digits to be lost.
