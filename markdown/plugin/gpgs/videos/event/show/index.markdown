# show

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, show
> __See also__          [gpgs.videos][plugin.gpgs.videos]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates that the user has completed interaction with the video capturing view.

## Gotchas

For this event, [event.isError][plugin.gpgs.videos.event.show.isError] will be `true` because the view was `"cancelled"`. This is not an error per se, but for consistency it's treated as one.

## Properties

#### [event.name][plugin.gpgs.videos.event.show.name]

#### [event.isError][plugin.gpgs.videos.event.show.isError]

#### [event.errorMessage][plugin.gpgs.videos.event.show.errorMessage]

#### [event.errorCode][plugin.gpgs.videos.event.show.errorCode]