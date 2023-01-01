# gpgs.achievements.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs.achievements.*][plugin.gpgs3.achievements]
>                       [gpgs.*][plugin.gpgs3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves information on all achievements available in the game.

## Syntax

	gpgs.achievements.load(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### reload ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the data will be pulled fresh, not from a cache.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [load][plugin.gpgs3.achievements.event.load] event.
