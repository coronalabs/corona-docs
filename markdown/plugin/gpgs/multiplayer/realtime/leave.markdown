# gpgs.multiplayer.realtime.leave()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, real-time, leave
> __See also__          [gpgs.multiplayer.realtime][plugin.gpgs.multiplayer.realtime]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Leaves the specified room. This will disconnect the player from the room but allow other players to continue playing the game. The result is delivered to the `room` listener defined using [gpgs.multiplayer.realtime.setListeners()][plugin.gpgs.multiplayer.realtime.setListeners].

## Gotchas

After this method is called, you cannot perform any further actions on the room, and you can only [create][plugin.gpgs.multiplayer.realtime.create] or [join][plugin.gpgs.multiplayer.realtime.join] another room after the correspoding [room][plugin.gpgs.multiplayer.realtime.event.room] event is received.

## Syntax

	gpgs.multiplayer.realtime.leave( roomId )

##### roomId ~^(required)^~
_[String][api.type.String]._ The room to leave.