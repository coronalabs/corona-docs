# showSelectPlayers

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, real-time, showSelectPlayers
> __See also__          [gpgs.multiplayer.realtime][plugin.gpgs.multiplayer.realtime]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates that the user has completed interaction with the show players view.

## Gotchas

For this event, [event.isError][plugin.gpgs.multiplayer.realtime.event.showSelectPlayers.isError] will be `true` because the view was `"cancelled"`. This is not an error per se, but for consistency it's treated as one.

## Properties

#### [event.name][plugin.gpgs.multiplayer.realtime.event.showSelectPlayers.name]

#### [event.isError][plugin.gpgs.multiplayer.realtime.event.showSelectPlayers.isError]

#### [event.errorMessage][plugin.gpgs.multiplayer.realtime.event.showSelectPlayers.errorMessage]

#### [event.errorCode][plugin.gpgs.multiplayer.realtime.event.showSelectPlayers.errorCode]

#### [event.playerIds][plugin.gpgs.multiplayer.realtime.event.showSelectPlayers.playerIds]

#### [event.automatch][plugin.gpgs.multiplayer.realtime.event.showSelectPlayers.automatch]