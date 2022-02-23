# gpgs.players.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.players.*][plugin.gpgs2.players]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves information on current player, specified player or players.

## Syntax

	gpgs.players.load(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### playerId ~^(optional)^~
_[String][api.type.String]._ If provided loads only this player information. If not - loads the current player information.

##### playerIds ~^(optional)^~
_[Array][api.type.Array]._ Populate with [string][api.type.String] elements. If provided loads information on each specified player. Higher priority thann `playerId`.

##### source ~^(optional)^~
_[String][api.type.String]._ One of these:  `"connected"`, `"invitable"` or `"recentlyPlayedWith"`. If provided loads information on players from the specified source. Higher priority than `playerIds`.

##### limit ~^(optional)^~
_[Integer][api.type.Number]._ Limit results count to this value. All results internally are fetched in pages of 25 items each.

##### reload ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the data will be pulled fresh, not from a cache.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [load][plugin.gpgs2.players.event.load] event.