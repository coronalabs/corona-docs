# object.getAvailableAutoMatchSlots()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, Match, getAvailableAutoMatchSlots
> __See also__          [Match][plugin.gpgs.multiplayer.type.Match]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns an integer indicating the maximum number of available <nobr>auto-match</nobr> slots for this match. If <nobr>auto-match</nobr> criteria were not specified during match creation, or if all slots have been filled, this will return `0`.

## Syntax

	object.getAvailableAutoMatchSlots()