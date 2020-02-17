
# event.connectionStateChanged

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [inputDeviceStatus][api.event.inputDeviceStatus]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          inputDeviceStatus, connectionStateChanged
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Will be set to `true` if the input device's connection with the system has changed, such as from "connected" to "disconnected" or "disconnected" to "connected". You can easily access the input device's current connection state by accessing the [event.device.connectionState][api.type.InputDevice.connectionState] property.

Will be set to `false` if the input device's current connection with the system has not changed. This means that some other aspect of the input device's status has changed, such as it being reconfigured.

## Example

``````lua
-- Called when the status of an input device has changed.
local function onInputDeviceStatusChanged( event )
    if event.connectionStateChanged then
        print( event.device.displayName .. ": " .. event.device.connectionState )
    end
end

-- Set up the above function to receive input device status change events.
Runtime:addEventListener( "inputDeviceStatus", onInputDeviceStatusChanged )
``````
