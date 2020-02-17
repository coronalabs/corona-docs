# object.reportsAbsoluteDpadValues

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [InputDevice][api.type.InputDevice]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, MFi, reportsAbsoluteDpadValues
> __See also__          [object.driver][api.type.InputDevice.driver]
>                       [object.MFiProfile][api.type.InputDevice.MFiProfile]
>                       [MFi Controllers][guide.hardware.mfiControllers] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This value is specific to the Apple&nbsp;TV Remote ([object.MFiProfile][api.type.InputDevice.MFiProfile] is `"microGamepad"`).

Game controllers that implement the `"microGamepad"` profile usually implement the <nobr>D-pad</nobr> in hardware as a trackpad. The default value for this property is `false` which means that the location where the user first touches the trackpad is assumed to be the neutral value (`0.0`,`0.0`). All subsequent values are calculated relative to this position until the user lifts their finger. The next time the user's finger touches the trackpad, a new origin is chosen.

If this property is set to `true`, all values are calculated relative to the physical center of the touchpad.
