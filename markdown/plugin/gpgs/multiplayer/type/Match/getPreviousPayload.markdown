# object.getPreviousPayload()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, Match, getPreviousPayload
> __See also__          [Match][plugin.gpgs.multiplayer.type.Match]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns a [string][api.type.String] representing the match data from the previous match, if available.

## Gotchas

This is only provided on the first turn of a <nobr>re-matched</nobr> match.

## Syntax

	object.getPreviousPayload()