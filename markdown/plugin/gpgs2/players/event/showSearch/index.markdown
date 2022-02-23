# showSearch

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.players.*][plugin.gpgs2.players]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates that the search players view was closed.

## Gotchas

`event.isError` can be `true` because the view was `"cancelled"`, that's not an error per se, but for consistency it is treated as an error.

## Properties

#### [event.name][plugin.gpgs2.players.event.showSearch.name]

#### [event.isError][plugin.gpgs2.players.event.showSearch.isError]

#### [event.errorMessage][plugin.gpgs2.players.event.showSearch.errorMessage]

#### [event.errorCode][plugin.gpgs2.players.event.showSearch.errorCode]

#### [event.player][plugin.gpgs2.players.event.showSearch.player]