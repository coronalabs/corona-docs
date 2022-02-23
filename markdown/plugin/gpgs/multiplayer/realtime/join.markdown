# gpgs.multiplayer.realtime.join()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, real-time, join
> __See also__          [gpgs.multiplayer.realtime][plugin.gpgs.multiplayer.realtime]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Joins a real-time room by accepting an invitation. The lifetime of the current game's connection to the room is bound to this client's lifecycle. When the client disconnects, the player will leave the room and any <nobr>peer-to-peer</nobr> connections for this player will be torn down. The result is delivered to the `room` listener defined via [gpgs.multiplayer.realtime.setListeners()][plugin.gpgs.multiplayer.realtime.setListeners].

## Syntax

	gpgs.multiplayer.realtime.join( invitationId )

##### invitationId ~^(required)^~
_[String][api.type.String]._ The invitation to accept (and&nbsp;join the associated&nbsp;room).