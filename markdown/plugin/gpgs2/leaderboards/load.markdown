# gpgs.leaderboards.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.leaderboards.*][plugin.gpgs2.leaderboards]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves information on all leaderboards available in the game.

## Syntax

	gpgs.leaderboards.load(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### leaderboardId ~^(optional)^~
_[String][api.type.String]._ If provided loads information only about this leaderboard.

##### reload ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the data will be pulled fresh, not from a cache.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [load][plugin.gpgs2.leaderboards.event.load] event.