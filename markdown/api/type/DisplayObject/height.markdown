
# object.height

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          object, height, size
> __See also__          [object.contentHeight][api.type.DisplayObject.contentHeight]
>								[object.width][api.type.DisplayObject.width]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieve or change the height of a display object. For [text][api.library.display.newText] objects, this property can be used to get (but&nbsp;not&nbsp;set) the height.

For images, the returned value is the original bitmap height, including any transparent area.


## Gotchas

This value is unaffected by [object:scale()][api.type.DisplayObject.scale] or [object.yScale][api.type.DisplayObject.yScale]. Likewise, the value is not affected by object rotation.


## Example

``````lua
local rect1 = display.newRect( 100, 100, 50, 50 )
rect1:setFillColor( 0.5, 0, 1 )
 
local rect2 = display.newRect( 100, 100, 50, 50 )
rect2:setFillColor( 1, 0, 0 )
rect2.y = rect1.y + rect1.height+10

local rect3 = display.newRect( 150, 75, 50, 50 )
rect3:setFillColor( 0, 0.5, 1 )
rect3.anchorY = 0

transition.to( rect3, { time=2000, height=110 } )
``````