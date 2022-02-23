# gpgs.multiplayer.realtime.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, real-time, show
> __See also__          [gpgs.multiplayer.realtime][plugin.gpgs.multiplayer.realtime]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Shows a view that will display a "waiting&nbsp;room" screen which shows the progress of participants joining a <nobr>real-time</nobr> multiplayer room.

## Syntax

	gpgs.multiplayer.realtime.show( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### roomId ~^(optional)^~
_[String][api.type.String]._ The multiplayer room ID.

##### minPlayersRequired ~^(optional)^~
_[Number][api.type.Number]._ If desired, the waiting room can allow the user to start playing the game even before the room is fully connected, and this is controlled by the `minPlayersRequired` parameter. If at least this many participants __including__ the current player are connected to the room, a "start" menu item will be enabled in the waiting&nbsp;room&nbsp;UI. Setting `minPlayersRequired` to `0` means that the item will always be available, while omitting this parameter will disable the item entirely. Note that if you allow any user to start early, you'll need to handle the situation by explicitly telling the other connected peers that the game is now starting.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [show][plugin.gpgs.multiplayer.realtime.event.show] event.
