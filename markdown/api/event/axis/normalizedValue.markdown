
# event.normalizedValue

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [axis][api.event.axis]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          axis, normalized, value
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This is a scaled axis value that will never exceed -1.0 and 1.0. It is intended to be used as a scale which you can apply to velocity vectors or for positioning objects onscreen. This normalized value is much more convenient to use than the [rawValue][api.event.axis.rawValue] property because you don't have to deal with the varying min/max axis ranges provided by different input devices, allowing your application to handle all axis data in a uniform manner.

The normalized value will range between -1.0 and 1.0 if the axis' [min][api.type.InputAxis.minValue] and [max][api.type.InputAxis.maxValue] properties are negative and positive respectively. This is the range used by joysticks and scroll wheels.

The normalized value will range between 0.0 and 1.0 if the axis' [min][api.type.InputAxis.minValue] and [max][api.type.InputAxis.maxValue] properties are greater than or equal to zero. This is commonly used by analog triggers on gamepads, touchscreens, touchpads, mice, and trackpads.

The normalized value will range between -1.0 and 0.0 if the axis' [min][api.type.InputAxis.minValue] and [max][api.type.InputAxis.maxValue] properties are less than or equal to zero. A gamepad's analog triggers are sometimes in this range.
