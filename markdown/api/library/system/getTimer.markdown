# system.getTimer()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system timer, timer, time, millisecond
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns time in milliseconds since application launch. The fractional part of the returned value may return microseconds if the hardware supports it.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* This value is unaffected by system clock changes and it always counts up.
* This value will be affected (paused) when the app is suspended.

</div>


## Syntax

	system.getTimer()


## Examples

``````lua
print( system.getTimer() )  -- Displays the time running (in milliseconds)
``````
