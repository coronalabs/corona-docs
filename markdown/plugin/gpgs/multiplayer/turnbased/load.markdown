# gpgs.multiplayer.turnbased.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, turn-based, load
> __See also__          [gpgs.multiplayer.turnbased][plugin.gpgs.multiplayer.turnbased]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves information on a specific <nobr>turn-based</nobr> match or all <nobr>turn-based</nobr> matches for the current player.

## Syntax

	gpgs.multiplayer.turnbased.load( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### matchId ~^(optional)^~
_[String][api.type.String]._ If provided, loads only this match information. If omitted, information on all matches will be loaded.

##### filters ~^(optional)^~
_[Array][api.type.Array]._ Populate with [string][api.type.String] elements. If provided, selects only specified turn states of matches. Elements of this array can be `"complete"`, `"invited"`, <nobr>`"my turn"`</nobr>, or <nobr>`"their turn"`</nobr>.

##### mostRecentFirst ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the results will be sorted by date. By default, the results are sorted in social order.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [load][plugin.gpgs.multiplayer.turnbased.event.load] event.