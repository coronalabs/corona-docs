# gpgs.multiplayer.turnbased.cancel()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, turn-based, cancel
> __See also__          [gpgs.multiplayer.turnbased][plugin.gpgs.multiplayer.turnbased]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Cancels a match.

## Syntax

	gpgs.multiplayer.turnbased.cancel( matchId )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### matchId ~^(required)^~
_[String][api.type.String]._ The match to cancel.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [cancel][plugin.gpgs.multiplayer.turnbased.event.cancel] event.