# object:vibrate()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [InputDevice][api.type.InputDevice]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, vibrate, canVibrate
> __See also__			[object.canVibrate][api.type.InputDevice.canVibrate]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Causes the input device to vibrate/rumble.

This is a feature that is typically only supported by gamepads. You can determine if the input device supports vibration feedback by reading its [canVibrate][api.type.InputDevice.canVibrate] property.

## Gotchas

On Android, you must add the following permission to the `build.settings` file.

``````lua
settings =
{
    android =
    {
        usesPermissions =
        {
            "android.permission.VIBRATE",
        },
    },
}
``````

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