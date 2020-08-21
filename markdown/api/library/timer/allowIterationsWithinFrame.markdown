# timer.allowInterationsWithinFrame

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Library__           [timer.*][api.library.timer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          timer, allowInteractionsWithinFrame
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Changes the behavior of the timer object to provide events as soon as possible instead of waiting until the next frame to execute. The default behavior is `false`, meaning that timers fire on frame intervals. Setting this to `true` will enable the events to arrive as soon as possible.

## Syntax

	timer.allowInteratonsWithinFrame

## Example

`````lua
timer.allowInterationsWithinFrame = true
`````
