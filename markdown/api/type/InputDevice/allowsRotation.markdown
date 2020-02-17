# object.allowsRotation

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [InputDevice][api.type.InputDevice]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, MFi, allowsRotation
> __See also__          [object.driver][api.type.InputDevice.driver]
>                       [object.MFiProfile][api.type.InputDevice.MFiProfile]
>                       [MFi Controllers][guide.hardware.mfiControllers] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This value is specific to the Apple&nbsp;TV Remote ([object.MFiProfile][api.type.InputDevice.MFiProfile] is `"microGamepad"`).

Game controllers that implement the `"microGamepad"` profile can be rotated between landscape and portrait orientation. The default value for this property is `false` which means that the values of the <nobr>D-pad</nobr> are always determined based on the controller's portrait orientation. If this property value is set to `true`, the <nobr>D-pad</nobr> values are calculated based on the device's current orientation <nobr>(landscape or portrait)</nobr>.
