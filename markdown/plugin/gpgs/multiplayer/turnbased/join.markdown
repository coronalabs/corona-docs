# gpgs.multiplayer.turnbased.join()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, turn-based, join
> __See also__          [gpgs.multiplayer.turnbased][plugin.gpgs.multiplayer.turnbased]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Joins a match.

## Syntax

	gpgs.multiplayer.turnbased.join( invitationId )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### invitationId ~^(required)^~
_[String][api.type.String]._ The invitation to accept (and&nbsp;join the associated&nbsp;match).

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [join][plugin.gpgs.multiplayer.turnbased.event.join] event.