# object.isLocationVisible

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [Map][api.type.Map]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          isLocationVisible
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A read-only Boolean value indicating whether the user's current location is visible within the area currently displayed on the map. This is based on an approximation, so it may be that the value is true when the user's position is slightly offscreen.

This property will always be `false` if the current location is unknown.

## Gotchas

In order to access current location on Android, you must set the following permissions in the `build.settings` file.

`````lua
settings =
{
    android =
    {
        usesPermissions =
        {
            -- Permission to retrieve current location from the GPS.
            "android.permission.ACCESS_FINE_LOCATION",

            -- Permission to retrieve current location from WiFi or cellular service.
            "android.permission.ACCESS_COARSE_LOCATION",
        },
    },
}
`````

## Example

``````lua
local isLocVisible = myMap.isLocationVisible
``````
