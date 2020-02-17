# object.anchorY

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          y, anchor
> __See also__          [Transforms and Anchors][guide.graphics.transform-anchor] _(guide)_
>						[Group Programming][guide.graphics.group] _(guide)_
>						[object.anchorY][api.type.DisplayObject.anchorY]
>						[display.setDefault()][api.library.display.setDefault]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This property allows you to control the alignment of the object along the __y__ direction.

In general, the anchors of an object control how geometry is positioned relative to the object's origin. A value of `0` corresponds to top alignment, meaning the top edge of the object is aligned with the origin. A value of `0.5` corresponds to center alignment. A value of `1` corresponds to bottom alignment.

By default, anchor values must range from `0.0` to `1.0` and the anchor of new objects is set to `0.5`, however these defaults can be modified (see&nbsp;below).


## Anchor Defaults

* The default anchor can be changed for all display objects via [display.setDefault()][api.library.display.setDefault].

* Non-constrained anchors are allowed via the `"isAnchorClamped"` setting of [display.setDefault()][api.library.display.setDefault]. In this case, setting anchor values outside of the `0.0` to `1.0` range will position the anchor outside the bounds of the display object.


## Gotchas

When you change an anchor value, the object's origin does __not__ change. Instead, its geometry moves relative to its origin. See the [Transforms and Anchors][guide.graphics.transform-anchor] guide for more information.


## Example

``````lua
local rect1 = display.newRect( 0, 0, 50, 50 )
rect1:setFillColor( 1, 0, 0 )
rect1.x = 100
rect1.y = 100

local rect2 = display.newRect( 0, 0, 50, 50 )
rect2:setFillColor( 1, 1, 1 )

rect2.anchorY = 0
rect2.x = 100
rect2.y = 100
``````