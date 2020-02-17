# object.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [InputDevice][api.type.InputDevice]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, type
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string that specifies what kind of device is connected to the system. Possible values are:

* `"keyboard"`
* `"mouse"`
* `"stylus"`
* `"trackball"`
* `"touchpad"`
* `"touchscreen"`
* `"joystick"`
* `"gamepad"`
* `"directionalPad"`
* `"steeringWheel"`
* `"flightStick"`
* `"guitar"`
* `"drumSet"`
* `"dancePad"`
* `"unknown"`


## Example

``````lua
-- Called when a key event has been received.
local function onKeyEvent( event )
    if event.device then
    	print( "Device Type: " .. event.device.type )
    end
end

-- Set up the above function to receive key events.
Runtime:addEventListener( "key", onKeyEvent )
``````
