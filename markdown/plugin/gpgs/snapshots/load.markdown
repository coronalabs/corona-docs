# gpgs.snapshots.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, snapshots, load
> __See also__          [gpgs.snapshots][plugin.gpgs.snapshots]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves information on all snapshots for the current game.

## Syntax

	gpgs.snapshots.load( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### reload ~^(optional)^~
_[Boolean][api.type.Boolean]._ Supported only on Android; if `true`, the data will be retrieved fresh, not from a cache.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [load][plugin.gpgs.snapshots.event.load] event.