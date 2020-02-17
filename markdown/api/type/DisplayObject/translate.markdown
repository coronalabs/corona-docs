# object:translate()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          translate, x, y, positioning
> __See also__          [object.x][api.type.DisplayObject.x]
>								[object.y][api.type.DisplayObject.y]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Effectively adds values to the [object.x][api.type.DisplayObject.x] and [object.y][api.type.DisplayObject.y] properties of an object, thus changing its screen position.

## Syntax

	object:translate( deltaX, deltaY )
	
##### deltaX, deltaY ~^(required)^~
_[Numbers][api.type.Number]._ Amount to add to the object's __x__ and __y__ properties respectively.

## Gotchas

This cannot be used on a physical [body][api.type.Body] during a collision event. However, your collision handler may set a flag or include a time delay via [timer.performWithDelay()][api.library.timer.performWithDelay] so that the action can occur in the next application cycle or later. See the [Collision&nbsp;Detection][guide.physics.collisionDetection] guide for a complete list of which APIs and methods are subject to this rule.