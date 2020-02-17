# object.number

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [InputAxis][api.type.InputAxis]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, axis, number
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The number assigned to an input device's axis. This number is based on the number of axes found on one input device. For example, if an input device has 4 axes, then they will be assigned numbers `1`, `2`, `3`, and `4` in the order that they were found. You can use this number to uniquely identify an axis belonging to one input device. This axis number can be used as an index with the array returned by its input device's [getAxes()][api.type.InputDevice.getAxes] function.


## Gotchas

This axis number is the only reliable means of identifying an axis belonging to one input device. This is because it's possible for the axis [type][api.type.InputAxis.type] property to return duplicate type names, and this is especially true if the types are `"unknown"`. This is also because the [type][api.type.InputAxis.type] names do not always match what was actually pressed on the device (especially true for gamepads and joysticks designed for another platform). If you need to display the axis name to the user, you should display this axis number instead of the [type][api.type.InputAxis.type] property.


## Example

``````lua
-- Fetch all input devices currently connected to the system
local inputDevices = system.getInputDevices()

-- Traverse all input devices
for deviceIndex = 1,#inputDevices do
	-- Fetch the input device's axes
	local inputAxes = inputDevices[deviceIndex]:getAxes()

	-- Print all axis numbers
	for axisIndex = 1,#inputAxes do
		local inputAxis = inputAxes[axisIndex]
		print( inputAxis.descriptor .. ": Axis number = " .. tostring(inputAxis.number) )
	end
end
``````
