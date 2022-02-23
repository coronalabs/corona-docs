# object.getRematchId()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, Match, getRematchId
> __See also__          [Match][plugin.gpgs.multiplayer.type.Match]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns a [string][api.type.String] representing the match ID of the <nobr>re-match</nobr> that was created from this match, if any.

## Gotchas

This will only be <nobr>non-`nil`</nobr> if a <nobr>re-match</nobr> has been initiated.

## Syntax

	object.getRematchId()