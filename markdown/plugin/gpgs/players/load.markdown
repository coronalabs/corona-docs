# players.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, players, load
> __See also__          [gpgs.players][plugin.gpgs.players]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves information on the current player, a specified player, or multiple players.

## Syntax

	gpgs.players.load( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### playerId ~^(optional)^~
_[String][api.type.String]._ Supported only on Android; if provided, loads information for only this player. If omitted, loads the current player's information.

##### playerIds ~^(optional)^~
_[Array][api.type.Array]._ Supported only on Android; populate with [string][api.type.String] elements to load information for each specified player. If provided, this has higher priority than `playerId`.

##### source ~^(optional)^~
_[String][api.type.String]._ One of the following values. If provided, this has higher priority than `playerIds` and loads information on players from the specified source. 

* `"connected"`
* `"invitable"` (Android only)
* `"recentlyPlayedWith"`

##### limit ~^(optional)^~
_[Number][api.type.Number]._ Limits the number of results to this value. All results are internally fetched in batches of 25 items each.

##### reload ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the data will be retrieved fresh, not from a cache.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [load][plugin.gpgs.players.event.load] event.
