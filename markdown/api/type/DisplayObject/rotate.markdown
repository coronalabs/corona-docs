# object:rotate()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          rotate, rotation
> __See also__          [object.rotation][api.type.DisplayObject.rotation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Effectively adds a value (`deltaAngle`) to the object's current [rotation][api.type.DisplayObject.rotation]. This rotation is based on degrees in the clockwise direction. The rotation occurs around the object's anchor point.

Use [object.rotation][api.type.DisplayObject.rotation] to set (or&nbsp;get) the current rotation value of the object.


## Gotchas

This cannot be used on a physical [body][api.type.Body] during a collision event. However, your collision handler may set a flag or include a time delay via [timer.performWithDelay()][api.library.timer.performWithDelay] so that the action can occur in the next application cycle or later. See the [Collision&nbsp;Detection][guide.physics.collisionDetection] guide for a complete list of which APIs and methods are subject to this rule.


## Syntax

	object:rotate( deltaAngle )

##### deltaAngle ~^(required)^~
_[Number][api.type.Number]._ Degrees to rotate. A positive number rotates the object clockwise and a negative number rotates the object <nobr>counter-clockwise</nobr>.


## Example

``````lua
local rect = display.newRect( 50, 50, 100, 200 )
rect:setFillColor( 1, 0, 0 )

-- Rotate the rectangle 45 degrees
rect:rotate( 45 )
``````