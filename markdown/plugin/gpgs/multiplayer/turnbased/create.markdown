# gpgs.multiplayer.turnbased.create()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, turn-based, create
> __See also__          [gpgs.multiplayer.turnbased][plugin.gpgs.multiplayer.turnbased]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Creates a new <nobr>turn-based</nobr> match for the current game. If provided with <nobr>auto-match</nobr> parameters, the server will attempt to find any <nobr>previously-created</nobr> matches that satisfy these parameters and join the current player into the previous match. If a suitable match cannot be found, a new match will be created.

## Syntax

	gpgs.multiplayer.turnbased.create( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### playerId ~^(optional)^~
_[String][api.type.String]._ If specified, invites only this player.

##### playerIds ~^(optional)^~
_[Array][api.type.Array]._ Populate with [string][api.type.String] elements to invite all specified players. If provided, this has higher priority than `playerId`.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [create][plugin.gpgs.multiplayer.turnbased.event.create] event.

##### automatch ~^(optional)^~
_[Table][api.type.Table]._ Specifies auto-match options &mdash; see the next section for details.

## Auto-Match Parameters

##### minPlayers ~^(optional)^~
_[Number][api.type.Number]._ Minimum number of auto-matched players.

##### maxPlayers ~^(optional)^~
_[Number][api.type.Number]._ Maximum number of auto-matched players.

##### exclusionBits ~^(optional)^~
_[Number][api.type.Number]._ Exclusive bit masks for the <nobr>auto-matching</nobr> request. The logical `and` of each pairing of <nobr>auto-matching</nobr> requests must equal `0` for an <nobr>auto-match</nobr>.

##### variant ~^(optional)^~
_[Number][api.type.Number]._ This is an optional, <nobr>developer-controlled</nobr> parameter describing the type of game to play, used for <nobr>auto-matching</nobr> criteria. Must be a positive integer.
