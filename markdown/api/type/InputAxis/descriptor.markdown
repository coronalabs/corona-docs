# object.descriptor

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [InputAxis][api.type.InputAxis]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, axis, descriptor
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides a human-readable string (assigned by Corona) which can be used to uniquely identify one axis input belonging to one device. This descriptor string is intended to be used by applications that set up key and axis bindings with a particular device, such as the first joystick connected to the system.

This descriptor string key is generated based on the device's [descriptor][api.type.InputDevice.descriptor] and the axis number. For example, the first 2 axes belonging to one joystick will be named `Joystick 1: Axis 1` and `Joystick 1: Axis 2`.


## Example

``````lua
-- Fetch all input devices currently connected to the system
local inputDevices = system.getInputDevices()

-- Traverse all input devices
for deviceIndex = 1,#inputDevices do
	-- Fetch the input device's axes
	local inputAxes = inputDevices[deviceIndex]:getAxes()

    -- Print all axis descriptors
	for axisIndex = 1,#inputAxes do
		print( inputAxes[axisIndex].descriptor )
	end
end
``````
