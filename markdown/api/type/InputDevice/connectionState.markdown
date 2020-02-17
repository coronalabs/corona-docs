# object.connectionState

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [InputDevice][api.type.InputDevice]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, connectionState
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates the input device's current connection state with the system such as "connected", "disconnected", etc.

Possible return values are:

> --------------------- ------------------------------------------------------------------------------------------
> __State__             __Description__
> "connected"           Indicates that the input device is availabe and can provide input events.
> "disconnected"        Indicates that the connection to the input device has been lost. Will no longer provide input events.
> "connecting"          Reserved for future use.
> "disconnecting"       Reserved for future use.
> --------------------- ------------------------------------------------------------------------------------------


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
