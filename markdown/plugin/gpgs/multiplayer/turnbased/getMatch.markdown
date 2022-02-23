# gpgs.multiplayer.turnbased.getMatch()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, turn-based, getMatch
> __See also__          [gpgs.multiplayer.turnbased][plugin.gpgs.multiplayer.turnbased]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns a [Match][plugin.gpgs.multiplayer.type.Match] object. To use this method, the specified match must be previously created, loaded, or joined.

## Syntax

	gpgs.multiplayer.turnbased.getMatch( matchId )

##### matchId ~^(required)^~
_[String][api.type.String]._ The match to retrieve.