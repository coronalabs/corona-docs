# gpgs.multiplayer.turnbased.finish()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, turn-based, finish
> __See also__          [gpgs.multiplayer.turnbased][plugin.gpgs.multiplayer.turnbased]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates that a participant is finished with a match. Optionally sends match results to specified participants.

## Syntax

	gpgs.multiplayer.turnbased.finish( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### matchId ~^(required)^~
_[String][api.type.String]._ The multiplayer match ID.

##### payload ~^(optional)^~
_[String][api.type.String]._ Match data to send to other participants. This has a size limit as noted in [gpgs.multiplayer.getLimits()][plugin.gpgs.multiplayer.getLimits].

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [finish][plugin.gpgs.multiplayer.turnbased.event.finish] event.

##### results ~^(optional)^~
_[Array][api.type.Array]._ Populate with result table elements as defined in the next section. The client which calls `finish()` is responsible for reporting the results for all appropriate participants in the match. Not every participant is required to have a result, but providing results for participants who are not in the match is an error.

## Results Parameters

The `results` array can be populated with child tables, each containing individual participant details:

##### participantId ~^(required)^~
_[String][api.type.String]._ Participant to send the result to.

##### result ~^(optional)^~
_[String][api.type.String]._ The result of the match. Can be either `"disagreed"`, `"disconnect"`, `"loss"`, `"tie"`, `"win"`, or `"none"`. Default is `"none"`.

##### placing ~^(optional)^~
_[Number][api.type.Number]._ The place/rank the participant has earned.
