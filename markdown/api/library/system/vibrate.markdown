# system.vibrate()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          vibrate, haptic, taptic
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Vibrates and haptic feedback on a phone. In the Corona Simulator, this will sound a system beep (macOS&nbsp;only).

## Gotchas

Haptic Feedback is only supported Solar2D 2021.3660+ but classic `"system.vibrate()"` works on older builds 

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

    system.vibrate([type, style])
	
##### type ~^(optional)^~
_[String][api.type.String]._ The possible types are `"impact"`, `"selection"` and `"notification"`. If no value is specified the device will do a classic vibrate

##### style ~^(optional)^~
_[String][api.type.String]._ The possible styles for `"impact"` are `"light"`, `"medium"` and `"heavy"`. The default type is `"medium"`. The possible styles for `"notification"` are `"warning"`, `"success"` and `"error"`. The default type is `"success"`. 



## Examples

##### Classic Vibrate
``````lua
--make the device vibrate
system.vibrate()
``````

##### Haptic Feedback
``````lua
--medium impact
system.vibrate("impact") -- same as system.vibrate("impact", "medium")
--heavy impact
system.vibrate("impact", "heavy") 
--selection
system.vibrate("selection")
--warning notification
system.vibrate("notification", "warning")
``````
