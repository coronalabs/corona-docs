# leaderboards.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, leaderboards, load
> __See also__          [gpgs.leaderboards][plugin.gpgs.leaderboards]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves information for a specific leaderboard, or all leaderboards.

## Syntax

	gpgs.leaderboards.load( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### leaderboardId ~^(optional)^~
_[String][api.type.String]._ If provided, loads information about only this leaderboard. If omitted, all leaderboards will be loaded.

##### reload ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the data will be retrieved fresh, not from a cache.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [load][plugin.gpgs.leaderboards.event.load] event.