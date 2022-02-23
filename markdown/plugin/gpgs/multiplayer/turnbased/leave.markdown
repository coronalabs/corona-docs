# gpgs.multiplayer.turnbased.leave()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, turn-based, leave
> __See also__          [gpgs.multiplayer.turnbased][plugin.gpgs.multiplayer.turnbased]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Leaves a match. If it's currently the players turn, you must provide the participant ID who has the next turn or else specifiy that the match needs another <nobr>auto-match</nobr> participant.

## Syntax

	gpgs.multiplayer.turnbased.leave( matchId )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### matchId ~^(required)^~
_[String][api.type.String]._ The match to leave.

##### pendingParticipantId ~^(optional)^~
_[String][api.type.String]._ Participant who will have the next turn.

##### isPendingAutomatch ~^(optional)^~
_[Boolean][api.type.Boolean]._ Whether to wait for additional <nobr>auto-matched</nobr> players to take the next turn (if&nbsp;possible).

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [leave][plugin.gpgs.multiplayer.turnbased.event.leave] event.