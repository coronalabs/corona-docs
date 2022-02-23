# gpgs.players.loadStats()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.players.*][plugin.gpgs2.players]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Request the player stats data for the currently signed-in player and game.

## Syntax

	gpgs.players.loadStats(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### reload ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the data will be pulled fresh, not from a cache.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [loadStats][plugin.gpgs2.players.event.loadStats] event.