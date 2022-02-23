# gpgs.events.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.events.*][plugin.gpgs2.events]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves information on all events available in the game.

## Syntax

	gpgs.events.load(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### eventId ~^(optional)^~
_[String][api.type.String]._ If provided loads only this event information. If not - loads information on all events.

##### eventIds ~^(optional)^~
_[Array][api.type.Array]._ Populate with [string][api.type.String] elements. If provided loads information on each specified event. Higher priority thann `eventId`.

##### reload ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the data will be pulled fresh, not from a cache.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [load][plugin.gpgs2.events.event.load] event.