# object.permanentId

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [InputDevice][api.type.InputDevice]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, permanentId
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides the input device's unique string ID which will be consistent between reboots. That is, the ID for the input device will not change after rebooting the system. This means that this ID can be saved to file and used to set up key bindings with a very specific input device.

This ID will be unique amongst all physical input devices. This includes devices of the same model and manufacturer. However, note that Corona will sometimes provide multiple [InputDevice][api.type.InputDevice] objects for the same physical input device if it features multiple input types. For example, a game controller has a touchpad and Corona will report it as two [InputDevice][api.type.InputDevice] objects, a joystick and a mouse, both having the same permanent IDs.

Will return `nil` if the device does not have a permanent string ID assigned to it.

## Example

``````lua
-- Called when a key event has been received.
local function onKeyEvent( event )
    if event.device then
    	print( "Device's Permanent String ID: " .. tostring( event.device.permanentId ) )
    end
end

-- Set up the above function to receive key events.
Runtime:addEventListener( "key", onKeyEvent )
``````
