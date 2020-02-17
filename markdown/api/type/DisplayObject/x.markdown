# object.x

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          x, position
> __See also__          [object.y][api.type.DisplayObject.y]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Specifies the __x__ position (in local coordinates) of the object relative to its [parent][api.type.DisplayObject.parent] &mdash; specifically, the __x__ position of the object's [anchorX][api.type.DisplayObject.anchorX] point relative to its parent. Changing this value will move the object in the __x__ direction.

## Gotchas

This cannot be used on a physical [body][api.type.Body] during a collision event. However, your collision handler may set a flag or include a time delay via [timer.performWithDelay()][api.library.timer.performWithDelay] so that the action can occur in the next application cycle or later. See the [Collision&nbsp;Detection][guide.physics.collisionDetection] guide for a complete list of which APIs and methods are subject to this rule.

## Example

``````lua
local rect = display.newRect( 0, 0, 50, 50 )
rect:setFillColor( 1, 1, 1 )

rect.x = 100
``````