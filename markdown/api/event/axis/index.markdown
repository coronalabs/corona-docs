
# axis

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          axis
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Axis events occur when analog data has been received from an [InputDevice][api.type.InputDevice] axis inputs. For example, axis events will be raised when a joystick has been moved, a gamepad's analog triggers have been pressed or released, a mouse has been moved, a scroll wheel has been moved, when movement has been detected on a touchpad/touchscreen, etc. This data is typically used by games which require analog controls.


## Properties

#### [event.axis][api.event.axis.axis]

#### [event.device][api.event.axis.device]

#### [event.name][api.event.axis.name]

#### [event.normalizedValue][api.event.axis.normalizedValue]

#### [event.rawValue][api.event.axis.rawValue]


## Example

``````lua
-- Called when an axis event has been received
local function onAxisEvent( event )
	print( event.axis.descriptor .. ": Normalized Value = " .. tostring(event.normalizedValue) )
end

-- Add the axis event listener
Runtime:addEventListener( "axis", onAxisEvent )
``````
