# gpgs.multiplayer.turnbased.send()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, turn-based, send
> __See also__          [gpgs.multiplayer.turnbased][plugin.gpgs.multiplayer.turnbased]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates that a participant has finished his turn and optionally sends match results to specified participants. For this call, you must indicate who will take the next turn.

## Syntax

	gpgs.multiplayer.turnbased.send( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### matchId ~^(required)^~
_[String][api.type.String]._ The multiplayer match ID.

##### pendingParticipantId ~^(optional)^~
_[String][api.type.String]._ Participant who will have the next turn.

##### isPendingAutomatch ~^(optional)^~
_[Boolean][api.type.Boolean]._ Whether to wait for additional <nobr>auto-matched</nobr> players to take the next turn (if&nbsp;possible).

##### payload ~^(optional)^~
_[String][api.type.String]._ The match data to send to other participants. This has a size limit as noted in [gpgs.multiplayer.getLimits()][plugin.gpgs.multiplayer.getLimits].

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [send][plugin.gpgs.multiplayer.turnbased.event.send] event.

##### results ~^(optional)^~
_[Array][api.type.Array]._ Populate with result table elements as defined in the next section. Note that the results reported here should be final&nbsp;&mdash; if results reported later conflict with these values, the returned value will indicate a conflicted result. This is most useful for cases where a participant knows their results early, for example a single elimination game where participants are eliminated but the game continues.

## Results Parameters

The `results` array can be populated with child tables, each containing individual participant details:

##### participantId ~^(required)^~
_[String][api.type.String]._ Participant to send the result to.

##### result ~^(optional)^~
_[String][api.type.String]._ The result of the match. Can be either `"disagreed"`, `"disconnect"`, `"loss"`, `"tie"`, `"win"`, or `"none"`. Default is `"none"`.

##### placing ~^(optional)^~
_[Number][api.type.Number]._ The place/rank the participant has earned.
