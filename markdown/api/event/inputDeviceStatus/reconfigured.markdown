
# event.reconfigured

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [inputDeviceStatus][api.event.inputDeviceStatus]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          inputDeviceStatus, reconfigured
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Will be set to `true` if the input device has been reconfigured, such as when axis inputs have been added or removed from the device, the [displayName][api.type.InputDevice.displayName] has been changed, or other configuration changes. You can access the device whose configuration has been changed via the [event.device][api.event.inputDeviceStatus.device] property.

Will be set to `false` if the input device's configuration has not been changed. This means that some other aspect of the input device's status has changed, such as it be connected or disconnected from the system.


## Gotchas

On Android, it is common for the operating system to change the [androidDeviceId][api.type.InputDevice.androidDeviceId] of an input device that has been reconnected to the system after it has been disconnected.


## Example

``````lua
-- Called when the status of an input device has changed.
local function onInputDeviceStatusChanged( event )
    if event.reconfigured then
        print( event.device.displayName .. " has been reconfigured." )
    end
end

-- Set up the above function to receive input device status change events.
Runtime:addEventListener( "inputDeviceStatus", onInputDeviceStatusChanged )
``````
