
# event.rawValue

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [axis][api.event.axis]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          axis, raw, value
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The raw value that was received from the device's axis input. This value is provided as-is from the operating system.

Note that this raw value is meaningless by itself. The raw value is relative to the axis' range and must be compared against the axis' [minValue][api.type.InputAxis.minValue] and [maxValue][api.type.InputAxis.maxValue] properties in order to do something useful with it. The range of an axis input can vary wildly between different device types. This is especially true for touchscreens and touchpads. For example, the max value for a touchscreen may be set to the size of the screen in pixels. For touchpads, values are usually not reported in pixels and its max range may be set to an arbitrary value by the manufacturer.

Also note that the raw axis values provided by joysticks and gamepads are typically already normalized by the device. This means that the raw value reported by this property will almost always match the [normalizedValue][api.event.axis.normalizedValue] property for these devices.

It is recommended that you use the event's [normalizedValue][api.event.axis.normalizedValue] property instead of the raw value. The normalized value is calculated by Corona to be a value between -1.0 and 1.0 for all axis ranges, which provides a uniform axis value that can be easily used as a scale by your application.
