# object.descriptor

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [InputDevice][api.type.InputDevice]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, descriptor
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides a unique human readable string assigned by Corona used to uniquely identify the device. This descriptor string is intended to be used by applications that set up key bindings with a particular device, such as the first joystick connected to the system.

This descriptor string key is generated based on the device type and the number of devices of that same type. For example, if you have two joysticks and one mouse connected, then Corona will assign descriptor strings "Joystick 1", "Joystick 2", and "Mouse 1" to these devices respectively.

## Example

``````lua
-- Called when a key event has been received.
local function onKeyEvent( event )
    if event.device then
    	print( "Device Descriptor: " .. event.device.descriptor )
    end
end

-- Set up the above function to receive key events.
Runtime:addEventListener( "key", onKeyEvent )
``````
