# object.maxValue

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [InputAxis][api.type.InputAxis]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, axis, max, maximum, value
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates the maximum value that an axis input event will provide. This property and the [object.minValue][api.type.InputAxis.minValue] property are needed to make sense of the raw data received by an axis because it will indicate how far that axis has been moved relative to its range.


## Gotchas

* A joystick typically has a maximum and minimum value range of `1.0` and `-1.0` respectively.

* A touchscreen's maximum value will usually be the length of the screen in pixels, with a minimum value of `0`.

* A touchpad's maximum value is typically a large value using an unknown unit of measure, meaning that you have to evaluate the relative position of the received axis data based on the minimum and maximum value properties.


## Example

``````lua
-- Fetch all input devices currently connected to the system
local inputDevices = system.getInputDevices()

-- Traverse all input devices
for deviceIndex = 1,#inputDevices do
	-- Fetch the input device's axes
	local inputAxes = inputDevices[deviceIndex]:getAxes()

	-- Print all axis maximum property values
	for axisIndex = 1,#inputAxes do
		local inputAxis = inputAxes[axisIndex]
		print( inputAxis.descriptor .. ": Max value = " .. tostring(inputAxis.maxValue) )
	end
end
``````
