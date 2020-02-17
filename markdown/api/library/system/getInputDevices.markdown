# system.getInputDevices()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      Array of [InputDevice][api.type.InputDevice] devices
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          getInputDevices
> __See also__			[InputDevice][api.type.InputDevice]
>						[InputAxis][api.type.InputAxis]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns an array of [InputDevice][api.type.InputDevice] devices that are currently connected to the system, such as a touchscreen, keyboard, mouse, joystick, etc. Alternatively returns an empty array if no input devices are found. Note that input devices which were once connected but were later disconnected will not be returned by this function.

This function is intended to be called on application start and application resume. During normal runtime, it's better to use the [inputDeviceStatus][api.event.inputDeviceStatus] event instead &mdash; this event is triggered when new input devices are connected to the system or when existing devices are disconnected.


## Syntax

	system.getInputDevices()


## Example

``````lua
-- Fetch all input devices currently connected to the system
local inputDevices = system.getInputDevices()

-- Print all of the input devices found
if ( #inputDevices > 0 ) then
	print( "Input devices found:" )
	for index = 1,#inputDevices do
		print( index .. ") " .. inputDevices[index].displayName )
	end
else
	print( "No input devices found!" )
end
``````
