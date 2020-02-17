
# inputDeviceStatus

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          inputDeviceStatus
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event indicates that an input device's status has changed, such as when an input device has been connected or disconnected from the system or when the device's configuration has been changed.

This event can be used for the following scenarios:

* Remove touchscreen controls when a gamepad or joystick has been discovered.
* Provide a 2 player game option if a second game controller has been discovered.
* To pause a game when the player's game controller has been disconnected.


## Properties

#### [event.connectionStateChanged][api.event.inputDeviceStatus.connectionStateChanged]

#### [event.device][api.event.inputDeviceStatus.device]

#### [event.name][api.event.inputDeviceStatus.name]

#### [event.reconfigured][api.event.inputDeviceStatus.reconfigured]


## Example
 
``````lua
-- Called when one input device's status has been changed
local function onInputDeviceStatusChanged( event )
	-- handle the input device change
end

-- Add the input device status event listener
Runtime:addEventListener( "inputDeviceStatus", onInputDeviceStatusChanged )
``````
