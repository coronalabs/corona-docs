# players.loadStats()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, players, loadStats
> __See also__          [gpgs.players][plugin.gpgs.players]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Requests the player stats data for the current player and game.

## Syntax

	gpgs.players.loadStats( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### reload ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the data will be retrieved fresh, not from a cache.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [loadStats][plugin.gpgs.players.event.loadStats] event.