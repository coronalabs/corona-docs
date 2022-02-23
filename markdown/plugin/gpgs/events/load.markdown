# events.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, events, load
> __See also__          [gpgs.events][plugin.gpgs.events]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves information on all events available in the game.

## Syntax

	gpgs.events.load( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### eventId ~^(optional)^~
_[String][api.type.String]._ If provided, loads only this event information. If omitted, all events will be loaded.

##### eventIds ~^(optional)^~
_[Array][api.type.Array]._ Populate with [string][api.type.String] elements to load information on each specified event. If provided, this has higher priority than `eventId`.

##### reload ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the data will be retrieved fresh, not from a cache.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [load][plugin.gpgs.events.event.load] event.