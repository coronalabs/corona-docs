# showSelectPlayers

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, turn-based, showSelectPlayers
> __See also__          [gpgs.multiplayer.turnbased][plugin.gpgs.multiplayer.turnbased]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates that the user has completed interaction with the show players view.

## Gotchas

For this event, [event.isError][plugin.gpgs.multiplayer.turnbased.event.showSelectPlayers.isError] will be `true` because the view was `"cancelled"`. This is not an error per se, but for consistency it's treated as one.

## Properties

#### [event.name][plugin.gpgs.multiplayer.turnbased.event.showSelectPlayers.name]

#### [event.isError][plugin.gpgs.multiplayer.turnbased.event.showSelectPlayers.isError]

#### [event.errorMessage][plugin.gpgs.multiplayer.turnbased.event.showSelectPlayers.errorMessage]

#### [event.errorCode][plugin.gpgs.multiplayer.turnbased.event.showSelectPlayers.errorCode]

#### [event.playerIds][plugin.gpgs.multiplayer.turnbased.event.showSelectPlayers.playerIds]

#### [event.automatch][plugin.gpgs.multiplayer.turnbased.event.showSelectPlayers.automatch]