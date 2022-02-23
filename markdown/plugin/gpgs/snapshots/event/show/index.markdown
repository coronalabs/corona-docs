# show

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, show
> __See also__          [gpgs.snapshots][plugin.gpgs.snapshots]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates that the user has completed interaction with the snapshots view, or a specific snapshot was selected.

## Gotchas

For this event, [event.isError][plugin.gpgs.snapshots.event.show.isError] will be `true` because the view was `"cancelled"`. This is not an error per se, but for consistency it's treated as one.

## Properties

#### [event.name][plugin.gpgs.snapshots.event.show.name]

#### [event.isError][plugin.gpgs.snapshots.event.show.isError]

#### [event.errorMessage][plugin.gpgs.snapshots.event.show.errorMessage]

#### [event.errorCode][plugin.gpgs.snapshots.event.show.errorCode]

#### [event.snapshot][plugin.gpgs.snapshots.event.show.snapshot]

#### [event.isNew][plugin.gpgs.snapshots.event.show.isNew]