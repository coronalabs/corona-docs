# object.MFiProfile

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [InputDevice][api.type.InputDevice]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, MFi, MFiProfile
> __See also__          [object.driver][api.type.InputDevice.driver]
>                       [MFi Controllers][guide.hardware.mfiControllers] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string that specifies which MFi controller profile the device conforms to:

* `"gamepad"` &mdash; basic gamepads.
* `"extendedGamepad"` &mdash; gamepads with two thumbsticks and additional shoulder buttons/axes.
* `"microGamepad"` &mdash; Apple TV Remote.
* `nil` &mdash; non-MFi devices.

For more details on control layouts, see the [MFi Controllers][guide.hardware.mfiControllers] guide.