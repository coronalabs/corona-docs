# show

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.snapshots.*][plugin.gpgs2.snapshots]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates that the snapshot view was cancelled or a specific snapshot was selected.

## Gotchas

`event.isError` could be `true` because the view was `"cancelled"`, that's not an error per se, but for consistency it is treated as an error.

## Properties

#### [event.name][plugin.gpgs2.snapshots.event.show.name]

#### [event.isError][plugin.gpgs2.snapshots.event.show.isError]

#### [event.errorMessage][plugin.gpgs2.snapshots.event.show.errorMessage]

#### [event.errorCode][plugin.gpgs2.snapshots.event.show.errorCode]

#### [event.snapshot][plugin.gpgs2.snapshots.event.show.snapshot]

#### [event.isNew][plugin.gpgs2.snapshots.event.show.isNew]