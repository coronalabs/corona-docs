# show

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, invitations, show
> __See also__          [gpgs.multiplayer.invitations][plugin.gpgs.multiplayer.invitations]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates that the user has completed interaction with the invitations view. Carries selected <nobr>turn-based</nobr> or <nobr>real-time</nobr> match invitation data.

## Gotchas

For this event, [event.isError][plugin.gpgs.multiplayer.invitations.event.show.isError] will be `true` because the view was `"cancelled"`. This is not an error per se, but for consistency it's treated as one.

## Properties

#### [event.name][plugin.gpgs.multiplayer.invitations.event.show.name]

#### [event.isError][plugin.gpgs.multiplayer.invitations.event.show.isError]

#### [event.errorMessage][plugin.gpgs.multiplayer.invitations.event.show.errorMessage]

#### [event.errorCode][plugin.gpgs.multiplayer.invitations.event.show.errorCode]

#### [event.invitation][plugin.gpgs.multiplayer.invitations.event.show.invitation]

#### [event.matchId][plugin.gpgs.multiplayer.invitations.event.show.matchId]