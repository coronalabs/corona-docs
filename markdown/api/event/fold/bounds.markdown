
# event.bounds

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [fold][api.event.fold]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          fold, bounds, hinge
> __See also__          [fold][api.event.fold]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A table that describes the region of the screen covered by the fold or hinge, in content coordinates. Use it to keep important content and controls off the fold. It contains these properties:

* `x` &mdash; [Number][api.type.Number] position of the fold's left edge.
* `y` &mdash; [Number][api.type.Number] position of the fold's top edge.
* `width` &mdash; [Number][api.type.Number] width of the fold.
* `height` &mdash; [Number][api.type.Number] height of the fold.

On some devices the fold has no visible width, so `width` or `height` may be `0`.

This property is `nil` when the fold does not cross the app's view, for example when the device is closed. To look up the fold's position without waiting for an event, use [display.getReservedRegions()][api.library.display.getReservedRegions] on iOS.
