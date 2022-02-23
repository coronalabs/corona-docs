# showSend

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, showSend
> __See also__          [gpgs.requests][plugin.gpgs.requests]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates that the request was sent, or the view was closed without sending.

## Gotchas

For this event, [event.isError][plugin.gpgs.requests.event.showSend.isError] will be `true` because the view was `"cancelled"`. This is not an error per se, but for consistency it's treated as one.

## Properties

#### [event.name][plugin.gpgs.requests.event.showSend.name]

#### [event.isError][plugin.gpgs.requests.event.showSend.isError]

#### [event.errorMessage][plugin.gpgs.requests.event.showSend.errorMessage]

#### [event.errorCode][plugin.gpgs.requests.event.showSend.errorCode]