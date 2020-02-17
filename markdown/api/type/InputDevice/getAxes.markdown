# object:getAxes()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [InputDevice][api.type.InputDevice]
> __Return value__      [Array][api.type.Array] of [InputAxis][api.type.InputAxis]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, getAxes
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Fetches information about all axis inputs available on the device. This information can be used to detect the device's capabilities, such as whether or not an analog joystick is available.

## Return Value

Returns an array of [InputAxis][api.type.InputAxis] tables providing information about each axis input available on the device.

Returns an empty array if the input device does not have any axis inputs. This is typically the case for keyboards.

## Example

``````lua
-- Fetch all input devices currently connected to the system.
local inputDevices = system.getInputDevices()

-- Traverse all input devices.
for deviceIndex = 1, #inputDevices do
    -- Fetch the input device's axes.
    local inputAxes = inputDevices[deviceIndex]:getAxes()
    if #inputAxes > 0 then
        -- Print all available axes to the log.
        for axisIndex = 1, #inputAxes do
            print(inputAxes[axisIndex].descriptor)
        end
    else
        -- Device does not have any axes.
        print(inputDevices[deviceIndex].descriptor .. ": No axes found.")
    end
end
``````
