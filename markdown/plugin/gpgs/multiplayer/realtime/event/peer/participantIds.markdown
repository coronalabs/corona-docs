# event.participantIds

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Array][api.type.Array]
> __Event__             [peer][plugin.gpgs.multiplayer.realtime.event.peer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, real-time, peer, participantIds
> __See also__          [peer][plugin.gpgs.multiplayer.realtime.event.peer]
>						[gpgs.multiplayer.realtime][plugin.gpgs.multiplayer.realtime]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[Array][api.type.Array] which contains [string][api.type.String] elements representing the list of affected participants. Only available for a [phase][plugin.gpgs.multiplayer.realtime.event.peer.phase] of <nobr>`"peer declined"`</nobr>, <nobr>`"peer invited to room"`</nobr>, <nobr>`"peer joined"`</nobr>, <nobr>`"peer left"`</nobr>, <nobr>`"peers connected"`</nobr>, or <nobr>`"peers disconnected"`</nobr>.