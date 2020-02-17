
# event.pressure

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [touch][api.event.touch]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          touch, pressure
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[Number][api.type.Number] indicating the pressure of a touch, typically used to detect "3D&nbsp;Touch" events on compatible iOS devices (for instance the iPhone&nbsp;6S). A value of `1.0` is the average touch pressure of the typical user. Knowing this, you can use a value <nobr>2-3</nobr> times higher to trigger special functionality.

## Gotchas

* This value will be `nil` if the device does not support <nobr>pressure-sensitive</nobr> touch.

* This event property is technically supported on Android, however the values are completely inconsistent between different devices/manufacturers. Thus, attempting to implement varying degrees of touch pressure on Android is impractical.
