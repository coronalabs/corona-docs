# object.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [InputAxis][api.type.InputAxis]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, axis, type
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string describing the type of axis input that an [InputDevice][api.type.InputDevice] has, such as `x` or `y` for a joystick's <nobr>__x__ axis</nobr> or <nobr>__y__ axis</nobr> input. See [Type Names](#names) below for a complete list of values.


## Gotchas

You should not rely on this property to identify the actual axis, since identifying the axis types of an input device is highly unreliable. It is common for an axis to misidentify itself, for example an axis identified as `rotationZ` for the <nobr>__x__ axis</nobr> of a right thumbstick. This is because there isn't a common standard for input device manufacturers beyond the first two axis inputs being the __x__ and __y__ of a joystick. Thus, you should not rely on this `type` property &mdash; it's better to provide a key and axis binding screen to the user for mapping input controls, much like how it's done for desktop games.


<a id="names"></a>

## Type Names

<div class="inner-table">

Name					Description
----------------------	------------------------------------------------------------------------------------------
`unknown`				The type of axis input is unknown.
`x`						For a joystick or gamepad, this is the absolute <nobr>__x__ axis</nobr> position of the stick.<br />For a touchscreen or mouse, this is the cursor's <nobr>__x__ axis</nobr> position on the screen, in pixels.<br />For a touchpad, this is the absolute <nobr>__x__ axis</nobr> position on the pad.
`y`						For a joystick or gamepad, this is the absolute <nobr>__y__ axis</nobr> position of the stick.<br />For a touchscreen or mouse, this is the cursor's <nobr>__y__ axis</nobr> position on the screen, in pixels.<br />For a touchpad, this is the absolute <nobr>__y__ axis</nobr> position on the pad.
`z`						Represents the <nobr>__z__ axis</nobr> for a 3D input device.
`rotationX`				Indicates that the device provides rotation input around the <nobr>__x__ axis</nobr>.
`rotationY`				Indicates that the device provides rotation input around the <nobr>__y__ axis</nobr>.
`rotationZ`				Indicates that the device provides rotation input around the <nobr>__z__ axis</nobr>. This is commonly used by a flightstick where the joystick can be rotated to conrol the rudder.
`hatX`					The absolute <nobr>__x__ axis</nobr> position of a hat switch, typically found at the top of a flightstick.
`hatY`					The absolute <nobr>__y__ axis</nobr> position of a hat switch, typically found at the top of a flightstick.
`leftTrigger`			The left analog trigger on a gamepad.
`rightTrigger`			The right analog trigger on a gamepad.
`gas`					Indicates that the device provides "gas&nbsp;pedal" input. On Android, this will sometimes represent the right analog trigger on a gamepad.
`brake`					Indicates that the device provides "brake&nbsp;pedal" input. On Android, this will sometimes represent the left analog trigger on a gamepad.
`wheel`					Provides the absolute position of a steering wheel.
`rudder`				Absolute position of the rudder from a flightstick or pedals.
`throttle`				Absolute position of a throttle or slider device.
`whammyBar`				Absolute position of the whammy bar from a guitar.
`leftX`					The absolute <nobr>__x__ axis</nobr> position of the left thumbstick on a Windows XInput gamepad.
`leftY`					The absolute <nobr>__y__ axis</nobr> position of the left thumbstick on a Windows XInput gamepad.
`rightX`				The absolute <nobr>__x__ axis</nobr> position of the right thumbstick on a Windows XInput gamepad.
`rightY`				The absolute <nobr>__y__ axis</nobr> position of the right thumbstick on a Windows XInput gamepad.
`verticalScroll`		Provides relative vertical movements from a scroll wheel or scroll ball.
`horizontalScroll`		Provides relative horizontal movements from a scroll wheel or scroll ball.
`orientation`			Indicates the direction of a stylus or finger relative to a surface.
`hoverDistance`			Provides the distance that a finger or stylus is being held away from the touchscreen or touchpad.
`hoverMajor`			Provides the length of the major axis of the stylus or finger that is about to touch the touchscreen or touchpad.
`hoverMinor`			Provides the length of the minor axis of the stylus or finger that is about to touch the touchscreen or touchpad.
`touchSize`				Provides the surface area that is in contact with the touchscreen or touchpad.
`touchMajor`			Provides the length of the major axis of the stylus or finger that is in contact with the touchscreen or touchpad.
`touchMinor`			Provides the length of the minor axis of the stylus or finger that is in contact with the touchscreen or touchpad.
`pressure`				Provides the amount of pressure applied to the touchscreen or touchpad. Can be used by a mouse or trackball to indicate that a button was pressed.
`tilt`					Provides the angle that a stylus is being held, relative to the surface.
`generic1`				Generic axis input 1. The data it provides is <nobr>device-specific</nobr>.
`generic2`				Generic axis input 2. The data it provides is <nobr>device-specific</nobr>.
`generic3`				Generic axis input 3. The data it provides is <nobr>device-specific</nobr>.
`generic4`				Generic axis input 4. The data it provides is <nobr>device-specific</nobr>.
`generic5`				Generic axis input 5. The data it provides is <nobr>device-specific</nobr>.
`generic6`				Generic axis input 6. The data it provides is <nobr>device-specific</nobr>.
`generic7`				Generic axis input 7. The data it provides is <nobr>device-specific</nobr>.
`generic8`				Generic axis input 8. The data it provides is <nobr>device-specific</nobr>.
`generic9`				Generic axis input 9. The data it provides is <nobr>device-specific</nobr>.
`generic10`				Generic axis input 10. The data it provides is <nobr>device-specific</nobr>.
`generic11`				Generic axis input 11. The data it provides is <nobr>device-specific</nobr>.
`generic12`				Generic axis input 12. The data it provides is <nobr>device-specific</nobr>.
`generic13`				Generic axis input 13. The data it provides is <nobr>device-specific</nobr>.
`generic14`				Generic axis input 14. The data it provides is <nobr>device-specific</nobr>.
`generic15`				Generic axis input 15. The data it provides is <nobr>device-specific</nobr>.
`generic16`				Generic axis input 16. The data it provides is <nobr>device-specific</nobr>.
----------------------	------------------------------------------------------------------------------------------
</div>


## Example

``````lua
-- Fetch all input devices currently connected to the system
local inputDevices = system.getInputDevices()

-- Traverse all input devices
for deviceIndex = 1,#inputDevices do
	-- Fetch the input device's axes
	local inputAxes = inputDevices[deviceIndex]:getAxes()

	-- Print available axis type information
	for axisIndex = 1,#inputAxes do
		local inputAxis = inputAxes[axisIndex]
		print( inputAxis.descriptor .. ": " .. inputAxis.type )
	end
end
``````
