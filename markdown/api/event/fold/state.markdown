
# event.state

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [fold][api.event.fold]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          fold, state, posture
> __See also__          [fold][api.event.fold]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string identifying the hinge's state with one of the following values:

* `"closed"` &mdash; The device is folded shut. On many devices the app runs on the outer screen in this state.
* `"halfOpen"` &mdash; The device is partly open, as in a "tabletop" or "book" posture.
* `"open"` &mdash; The device is opened flat.

You can also read the current state at any time with <nobr>`system.getInfo( "foldState" )`</nobr> ([reference][api.library.system.getInfo#foldstate]).

## Gotchas

* On Android, `"closed"` is reported only once the device is known to be foldable, for example when it has a hinge sensor or has reported a fold before.

* The Simulator only reports `"open"` and `"closed"`.
