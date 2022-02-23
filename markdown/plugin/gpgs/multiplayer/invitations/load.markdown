# gpgs.multiplayer.invitations.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, invitations, load
> __See also__          [gpgs.multiplayer.invitations][plugin.gpgs.multiplayer.invitations]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves information on all invitations for the current player.

## Syntax

	gpgs.multiplayer.invitations.load( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### mostRecentFirst ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the results will be sorted by date. By default, the results are sorted in social order.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [load][plugin.gpgs.multiplayer.invitations.event.load] event.