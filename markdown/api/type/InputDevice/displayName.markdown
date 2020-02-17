# object.displayName

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [InputDevice][api.type.InputDevice]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, displayName
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The name that was assigned to the input device by the system or end-user. Can be used to display the name of the device to the end-user, such as on a key/button binding screen.

On Android, this name will be the product name as assigned by the manufacturer unless the end-user changes it via Android's Bluetooth set up screen.

## Example

``````lua
-- Called when a key event has been received.
local function onKeyEvent( event )
    -- Fetch the device's display name.
    -- Note: The "device" property will be nil if the platform does not support input devices
    --       or if input came from software, such as a virtual keyboard.
    local deviceName = "Unknown Device"
    if event.device then
        deviceName = event.device.displayName
    end

    -- Print device information to the log.
    print( deviceName .. ": Pressed the '" .. event.keyName .. "' key " .. event.phase )
end

-- Set up the above function to receive key events.
Runtime:addEventListener( "key", onKeyEvent )
``````
