# system.vibrate()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          vibrate
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Vibrates the phone. In the Corona Simulator, this will sound a system beep (macOS&nbsp;only).

## Gotchas

To enable the vibrate function on Android devices, you must set the permission level in the `build.settings` file.

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

## Syntax

	system.vibrate()

## Examples

``````lua
--make the device vibrate
system.vibrate()
``````
