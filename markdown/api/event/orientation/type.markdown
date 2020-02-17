
# event.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [orientation][api.event.orientation]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          orientation, type
> __See also__			[orientation][api.event.orientation]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string identifying the new orientation of the device with one of the following values:

* `"portrait"`
* `"landscapeLeft"`
* `"portraitUpsideDown"`
* `"landscapeRight"`
* `"faceUp"`
* `"faceDown"`

## Gotchas

* The `"faceUp"` and `"faceDown"` orientations are only supported on iOS.

* The orientation event is independent of the application's user interface. As an example, if the app is <nobr>portrait-only,</nobr> you will still get an orientation event when the device is rotated to landscape.
