# object.xScale

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          x, scale, object scaling, size
> __See also__          [object.yScale][api.type.DisplayObject.yScale]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieve or change the scale of the object in the __x__ direction. The scaling occurs around the object's anchor point.

You can flip a [display object][api.type.DisplayObject] horizontally by passing a negative value to `object.xScale` as seen in the example below.

Valid examples include `1.0` for 100%, `2.0` for 200%, or `0.5` for 50%.

## Gotchas

* The `xScale` property can also be set as part of the [object:scale()][api.type.DisplayObject.scale] function.

* When a display object is converted into a physics object, scaling the object will change the visual size, but it will __not__ affect how the physics engine regards the object size. This could result in unpredictable results when interacting with other physics bodies.

## Example

``````lua
local rect1 = display.newRect( 25, 75, 50, 50 )
rect1:setFillColor( 1, 1, 1 )

-- Flip the rectangle horizontally
rect1.xScale = -1

local rect2 = display.newRect( 125, 75, 50, 50 )
rect2:setFillColor( 1, 0, 0 )

rect2.xScale = 2  -- Change the horizontal scale to 200%
``````