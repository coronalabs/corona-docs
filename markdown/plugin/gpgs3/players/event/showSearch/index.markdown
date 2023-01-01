# showSearch

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs.players.*][plugin.gpgs3.players]
>                       [gpgs.*][plugin.gpgs3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates that the search players view was closed.

## Gotchas

`event.isError` can be `true` because the view was `"cancelled"`, that's not an error per se, but for consistency it is treated as an error.

## Properties

#### [event.name][plugin.gpgs3.players.event.showSearch.name]

#### [event.isError][plugin.gpgs3.players.event.showSearch.isError]

#### [event.errorMessage][plugin.gpgs3.players.event.showSearch.errorMessage]

#### [event.errorCode][plugin.gpgs3.players.event.showSearch.errorCode]

#### [event.player][plugin.gpgs3.players.event.showSearch.player]