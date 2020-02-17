
# object.alpha

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          opacity, transparent, opaque
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This property represents the alpha value of a [display object][api.type.DisplayObject]. Use it to set or retrieve the object's opacity. A value of `0` is transparent and `1.0` is fully opaque.

This property is often used in the [transition.to()][api.library.transition.to] function to fade in/out an object over time.

## Gotchas

The alpha value set by [object:setFillColor][api.type.ShapeObject.setFillColor] only applies to the color/tint portion of the object, while `object.alpha` controls the overall opacity of the object, including the fill color/image. The fill alpha is the `object.alpha` value multiplied by the `object:setFillColor()` alpha value. Consider the following examples:

* If the `object:setFillColor()` alpha is `0`, the color/tint portion alpha of the object will be `0` no matter what the `object.alpha` value is.

* If the `object:setFillColor()` alpha is `0.5`, transitioning the `object.alpha` from `0` to `1` will transition the `object:setFillColor()` portion of the object from `0` to `0.5`.

Also note that an object may consist of both the [fill][api.type.ShapeObject.fill] color/tint and the [stroke][api.type.ShapeObject.stroke]. In&nbsp;this case, `object.alpha` controls the opacity of both portions, while [object:setFillColor][api.type.ShapeObject.setFillColor] only controls the fill color/tint.


## Examples
 
``````lua
local rect1 = display.newRect( 100, 100, 50, 50 )
rect1:setFillColor( 1, 0, 0 )

local rect2 = display.newRect( 125, 125, 50, 50 )
rect2:setFillColor( 1, 1, 1 )
rect2.alpha = 0.5
``````

``````lua
local object = display.newImage( "image.png" )
object.alpha = 0.75  -- set to 75% opacity
``````
