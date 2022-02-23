# gpgs.multiplayer.realtime.create()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, real-time, create
> __See also__          [gpgs.multiplayer.realtime][plugin.gpgs.multiplayer.realtime]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Creates a real-time room for the current game. The lifetime of the current game's connection to the room is bound to this client's lifecycle. When the client disconnects, the player will leave the room and any <nobr>peer-to-peer</nobr> connections for this player will be torn down. The result is delivered to the `room` listener defined via [gpgs.multiplayer.realtime.setListeners()][plugin.gpgs.multiplayer.realtime.setListeners].

## Syntax

	gpgs.multiplayer.realtime.create( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### playerId ~^(optional)^~
_[String][api.type.String]._ If specified, invites only this player.

##### playerIds ~^(optional)^~
_[Array][api.type.Array]._ Populate with [string][api.type.String] elements to invite all specified players. If provided, this has higher priority than `playerId`.

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
