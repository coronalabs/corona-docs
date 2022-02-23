# gpgs.multiplayer.getLimits()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, getLimits
> __See also__          [gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves various limits associated with the multiplayer API. Returns a [table][api.type.Table] if the service is available, otherwise `nil`.

## Syntax

	gpgs.multiplayer.getLimits()

## Return Reference

This function returns a [table][api.type.Table] containing the following properties:

* `reliablePayloadSize` &mdash; [Number][api.type.Number] indicating the maximum message size supported by "reliable&nbsp;send" in <nobr>real-time</nobr> multiplayer.

* `unreliablePayloadSize` &mdash; [Number][api.type.Number] indicating the maximum message size supported by "unreliable&nbsp;send" in <nobr>real-time</nobr> multiplayer.

* `matchPayloadSize` &mdash; [Number][api.type.Number] indicating the maximum data size per match, in bytes. This is guaranteed to be at least 128&nbsp;KB (may&nbsp;increase in the&nbsp;future).
