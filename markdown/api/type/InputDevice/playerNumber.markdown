# object.playerNumber

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [InputDevice][api.type.InputDevice]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, playerNumber
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Read-only property which returns the player number assigned to a game controller by the system, such as a Windows' XInput (Xbox) game controller or <nobr>Android 5.0+</nobr> game controller. For Windows XInput game controllers, this number ranges between `1` and `4`, typically indicated by a light on the controller. On Android&nbsp;TV and <nobr>Amazon Fire TV</nobr>, this number ranges between `1` and `4` as well.

This property will be `nil` if the [InputDevice][api.type.InputDevice] or system does not support assigning player numbers to a controller, such as HID and DirectInput devices on Windows, or HID devices on macOS.
