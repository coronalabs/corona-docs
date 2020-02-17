# object.canVibrate

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [InputDevice][api.type.InputDevice]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, vibrate, canVibrate
> __See also__			[object:vibrate()][api.type.InputDevice.vibrate]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Determines if the input device supports vibration/rumble feedback. This is a features that usually gamepads support.

Will return `true` if vibration is supported. This means that you can call the input device's [vibrate()][api.type.InputDevice.vibrate] function.

Will return `false` if vibration feedback is not supported by the input device or if it is not supported by the operating system.


## Example

``````lua
-- Called when a key event has been received
local function onKeyEvent( event )
	-- Vibrate the gamepad if its 'A' button was pressed
	if ( event.keyName == "buttonA" ) and ( event.phase == "down" ) then
		if event.device and event.device.canVibrate then
			event.device:vibrate()
		end
	end
end

-- Set up the above function to receive key events
Runtime:addEventListener( "key", onKeyEvent )
``````
