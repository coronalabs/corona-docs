
# event.orientation

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [fold][api.event.fold]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          fold, orientation, hinge
> __See also__          [fold][api.event.fold]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string giving the direction the fold runs across the screen:

* `"horizontal"` &mdash; The fold runs from left to right. When half open, this is the "tabletop" posture.
* `"vertical"` &mdash; The fold runs from top to bottom. When half open, this is the "book" posture.

This property is `nil` when the platform does not report where the fold is, for example when the device is closed.
