# system.setTapDelay()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          tap delay
> __See also__          [Tap/Touch/Multitouch][guide.events.touchMultitouch] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The delay time between when a tap is detected and when the [tap][api.event.tap] event is delivered. By default, this time is 0.

This is useful for distinguishing between single tap and double tap events. Without a delay, all taps are interpreted as single tap events.

## Syntax

	system.setTapDelay( delayTime )

##### delayTime ~^(required)^~
_[Number][api.type.Number]._ The delay time in seconds (__not__ milliseconds).
