# object.productName

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [InputDevice][api.type.InputDevice]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, productName
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This is typically the product name assigned to the device by the manufacturer. Unlike the [displayName][api.type.InputDevice.displayName] property, the product name will not change at runtime. You can use this name to profile game controllers so that you can safely assume what buttons or axes are available on the device and automatically bind them to your game's controls.

## Gotchas

On Windows, XInput devices do not provide the manufacturer's product name. Instead, the product name indicates the type of controller, for instance `"XInput Gamepad"`, `"XInput Arcade Pad"`, `"XInput Guitar"`, etc. (in other words, this product name will always start with `XInput`).
