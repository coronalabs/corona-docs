# system.orientation

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Library__           [system.*][api.library.system]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          orientation
> __See also__          [orientation][api.event.orientation]
>						[resize][api.event.resize]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

String value identifying the orientation of the device:

* `"portrait"`
* `"landscapeLeft"`
* `"portraitUpsideDown"`
* `"landscapeRight"`
* `"faceUp"`
* `"faceDown"`


## Gotchas

* The `"faceUp"` and `"faceDown"` orientations are only supported on iOS.

* Desktop apps built for [macOS][guide.distribution.macOSBuild] will always have an orientation property of `"portrait"`, even when the app is configured for landscape orientation. There is no real notion of orientation on the desktop, nor an orientation event.

* See the [orientation event][api.event.orientation] documentation for more <nobr>platform-specific</nobr> caveats.


## Syntax

	system.orientation


## Example

``````lua
print( "ORIENTATION: "..system.orientation )
``````
