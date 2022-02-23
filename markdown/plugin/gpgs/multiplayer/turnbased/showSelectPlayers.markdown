# gpgs.multiplayer.turnbased.showSelectPlayers()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, turn-based, showSelectPlayers
> __See also__          [gpgs.multiplayer.turnbased][plugin.gpgs.multiplayer.turnbased]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Shows a view that will let the user select players to invite to a <nobr>turn-based</nobr> multiplayer match.

## Gotchas

The minimum and maximum number of players passed in should be the desired number of __additional__ players to select&nbsp;&mdash; this does __not__ include the current player. So, for a game that should handle between 2 and 4 players, `minPlayers` would be `1` and `maxPlayers` would be `3`.

## Syntax

	gpgs.multiplayer.turnbased.showSelectPlayers( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### playerId ~^(optional)^~
_[String][api.type.String]._ Pre-selects this player to join the match.

##### playerIds ~^(optional)^~
_[Array][api.type.Array]._ Populate with [string][api.type.String] elements to <nobr>pre-select</nobr> these players. If provided, this has higher priority than `playerId`.

##### minPlayers ~^(optional)^~
_[Number][api.type.Number]._ The minimum number of players to select in addition to the current player.

##### maxPlayers ~^(optional)^~
_[Number][api.type.Number]._ The maximum number of players to select in addition to the current player.

##### allowAutomatch ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, displays an option for selecting <nobr>auto-match</nobr> players.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [showSelectPlayers][plugin.gpgs.multiplayer.turnbased.event.showSelectPlayers] event.
