# object.y

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          y, position
> __See also__          [object.x][api.type.DisplayObject.x]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Specifies the __y__ position (in local coordinates) of the object relative to its [parent][api.type.DisplayObject.parent] &mdash; specifically, the __y__ position of the object's [anchorY][api.type.DisplayObject.anchorY] point relative to its parent. Changing this value will move the object in the __y__ direction.

## Gotchas

This cannot be used on a physical [body][api.type.Body] during a collision event. However, your collision handler may set a flag or include a time delay via [timer.performWithDelay()][api.library.timer.performWithDelay] so that the action can occur in the next application cycle or later. See the [Collision&nbsp;Detection][guide.physics.collisionDetection] guide for a complete list of which APIs and methods are subject to this rule.

## Example

``````lua
local rect = display.newRect( 0, 0, 50, 50 )
rect:setFillColor( 1, 1, 1 )

rect.y = 100
``````