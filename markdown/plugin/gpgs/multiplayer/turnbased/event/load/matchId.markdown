# event.matchId

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [load][plugin.gpgs.multiplayer.turnbased.event.load]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, turn-based, load, matchId
> __See also__          [load][plugin.gpgs.multiplayer.turnbased.event.load]
>						[gpgs.multiplayer.turnbased][plugin.gpgs.multiplayer.turnbased]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] representing the ID of the match that was just loaded. This can be used along with [gpgs.multiplayer.turnbased.getMatch()][plugin.gpgs.multiplayer.turnbased.getMatch] to get the match object, but only if `matchId` is specified in the call.