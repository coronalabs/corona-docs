# object.width

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          object, width, size
> __See also__          [object.contentWidth][api.type.DisplayObject.contentWidth]
>								[object.height][api.type.DisplayObject.height]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieve or change the width of a display object. For [text][api.library.display.newText] objects, this property can be used to get (but&nbsp;not&nbsp;set) the width.

For images, the returned value is the original bitmap width, including any transparent area.


## Gotchas

This value is unaffected by [object:scale()][api.type.DisplayObject.scale] or [object.xScale][api.type.DisplayObject.xScale]. Likewise, the value is not affected by object rotation.


## Example

``````lua
local rect1 = display.newRect( 100, 100, 50, 50 )
rect1:setFillColor( 0.5, 0, 1 )
 
local rect2 = display.newRect( 100, 100, 50, 50 )
rect2:setFillColor( 1, 0, 0 )
rect2.x = rect1.x + rect1.width+10

local rect3 = display.newRect( 75, 150, 50, 50 )
rect3:setFillColor( 0, 0.5, 1 )
rect3.anchorX = 0

transition.to( rect3, { time=2000, width=110 } )
``````