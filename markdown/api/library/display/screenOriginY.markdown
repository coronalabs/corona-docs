
# display.screenOriginY

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          screen, origin, positioning
> __See also__          [display.screenOriginX][api.library.display.screenOriginX]
>						[display.safeScreenOriginY][api.library.display.safeScreenOriginY]
>						[display.getSafeAreaInsets()][api.library.display.getSafeAreaInsets]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns the __y__ distance from the top of the actual screen to the top of the content area, in Corona content units. For example, in `"letterbox"` or `"zoomEven"` scaling modes, there may be added area or cropped area on the current device screen. This lets you find out how much visible area has been added or removed on the current device.


## Example

##### config.lua

``````lua
application =
{
    content =
    {
        width = 320,
        height = 480,
        scale = "letterbox"
    },
}
``````

##### main.lua

``````lua
-- Create a grey background
local background = display.newRect( 0, 0, 320, 480 )
background:setFillColor( 0.5 )

-- Create two squares
local rect1 = display.newRect( 0, 0, 50, 50 )
local rect2 = display.newRect( 0, 0, 50, 50 )

-- Place the squares along the top edge ; offset the second square with "display.screenOriginY"
rect1.x = 62
rect2.x = 162
rect1.y = 25
rect2.y = 25 + display.screenOriginY
``````
