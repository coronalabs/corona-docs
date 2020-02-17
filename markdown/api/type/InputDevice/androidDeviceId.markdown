# object.androidDeviceId

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [InputDevice][api.type.InputDevice]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, androidDeviceId
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The unique integer ID assigned to the input device by Android.

Note that the ID assigned to the input device can change after rebooting the Android device. This means that you should never save this ID to file and only use it during the lifetime of the application. If you need an ID that will remain consistent after a reboot, then you should consider using the [permanentId][api.type.InputDevice.permanentId] identifier instead, if available.

Will return `nil` if:

* Reading this property on any platform other than Android.
* The input device is not managed by the Android operating system.

## Example

``````lua
-- Called when a key event has been received.
local function onKeyEvent( event )
    -- Print the device's unique Android ID, if available.
    -- Note: The "device" property will be nil if the platform does not support input devices
    --       or if input came from software, such as a virtual keyboard.
    if event.device then
    	print( "Android Device ID: " .. tostring( event.device.androidDeviceId ) )
    end
end

-- Set up the above function to receive key events.
Runtime:addEventListener( "key", onKeyEvent )
``````
