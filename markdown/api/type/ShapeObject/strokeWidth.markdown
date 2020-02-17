# object.strokeWidth

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [ShapeObject][api.type.ShapeObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          stroke, width, border
> __See also__          [ShapeObject:setStrokeColor()][api.type.ShapeObject.setStrokeColor]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Sets the stroke width of vector objects, in pixels. Note that stroke widths are broken up to inner and outer parts. The stroke is centered on the boundaries of the object, but when the stroke width is odd, Corona does an integer divide by 2 then a [math.floor()][api.library.math.floor] on the value. For example, `3 / 2 = 1` or `1 / 2 = 0`. The inner width is set to that value, and the remainder is the outer width. This avoids blurring around the edges of the stroke.


## Gotchas

* The stroke width of an object is `0` by default if not set.

* Modifying the stroke width affects the object's [width][api.type.DisplayObject.width]/[contentWidth][api.type.DisplayObject.contentWidth], [height][api.type.DisplayObject.height]/[contentHeight][api.type.DisplayObject.contentHeight], and its hit testing (touch/tap) bounds.


## Example

``````lua
local rect = display.newRect( 135, 100, 50, 50 )
rect:setFillColor( 1 ) 
rect:setStrokeColor( 1, 0 ,0 )
rect.strokeWidth = 5
``````