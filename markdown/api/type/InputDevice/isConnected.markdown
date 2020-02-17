# object.isConnected

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [InputDevice][api.type.InputDevice]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, isConnected
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Determines if the input device is currently connected to the system and can provide input events.

Will return `true` if the input device is currently available. The [connectionState][api.type.InputDevice.connectionState] property will be in the "connected" state in this case.

Will return `false` if the input device is unavailable and cannot provide input events. The [connectionState][api.type.InputDevice.connectionState] property will be in the "disconnected", "disconnecting", or "connecting" state in this case.


## Example

``````lua
-- Called when the status of an input device has changed.
local function onInputDeviceStatusChanged( event )
    if event.connectionStateChanged then
        if event.device.isConnected then
            -- Device has been connected.
            -- If was once disconnected, then you should resume the game.
        else
            -- Connection has been lost.
            -- You may want to pause the game and warn the user in this case.
        end
    end
end

-- Set up the above function to receive input device status change events.
Runtime:addEventListener( "inputDeviceStatus", onInputDeviceStatusChanged )
``````
