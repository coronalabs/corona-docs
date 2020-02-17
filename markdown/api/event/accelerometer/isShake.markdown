
# event.isShake

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [accelerometer][api.event.accelerometer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          accelerometer, isShake
> --------------------- ------------------------------------------------------------------------------------------

## Overview

When the user shakes the device, this value is `true`. What constitutes a shake is dependent on the OS/device.

## Example
 
`````lua
local function listener( event )
    if event.isShake then
        print( "The device is being shaken!" )
    end
    
    return true
end

Runtime:addEventListener( "accelerometer", listener )
`````
