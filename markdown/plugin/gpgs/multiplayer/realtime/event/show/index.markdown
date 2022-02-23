# show

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, real-time, show
> __See also__          [gpgs.multiplayer.realtime][plugin.gpgs.multiplayer.realtime]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates that the user has completed interaction with the waiting room view.

## Gotchas

For this event, [event.isError][plugin.gpgs.multiplayer.realtime.event.show.isError] will be `true` because the view was `"cancelled"`. This is not an error per se, but for consistency it's treated as one.

## Properties

#### [event.name][plugin.gpgs.multiplayer.realtime.event.show.name]

#### [event.isError][plugin.gpgs.multiplayer.realtime.event.show.isError]

#### [event.errorMessage][plugin.gpgs.multiplayer.realtime.event.show.errorMessage]

#### [event.errorCode][plugin.gpgs.multiplayer.realtime.event.show.errorCode]