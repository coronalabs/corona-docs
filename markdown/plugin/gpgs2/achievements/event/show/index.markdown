# show

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.achievements.*][plugin.gpgs2.achievements]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates that the achievement view was closed.

## Gotchas

`event.isError` will be `true` because the view was `"cancelled"`, that's not an error per se, but for consistency it is treated as an error.

## Properties

#### [event.name][plugin.gpgs2.achievements.event.show.name]

#### [event.isError][plugin.gpgs2.achievements.event.show.isError]

#### [event.errorMessage][plugin.gpgs2.achievements.event.show.errorMessage]

#### [event.errorCode][plugin.gpgs2.achievements.event.show.errorCode]