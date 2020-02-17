# object.rotation

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          rotation, object, rotate
> __See also__          [object:rotate()][api.type.DisplayObject.rotate]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Sets the rotation of an object in degrees; this rotation is based in the clockwise direction where `0` is directly upward. The rotation occurs around the object's anchor point.

Rotation can also be set using the [object:rotate()][api.type.DisplayObject.rotate] function.

## Gotchas

This cannot be used on a physical [body][api.type.Body] during a collision event. However, your collision handler may set a flag or include a time delay via [timer.performWithDelay()][api.library.timer.performWithDelay] so that the action can occur in the next application cycle or later. See the [Collision&nbsp;Detection][guide.physics.collisionDetection] guide for a complete list of which APIs and methods are subject to this rule.

## Examples

##### Explicit Rotation

``````lua
local rect = display.newRect( 100, 100, 50, 50 )
rect:setFillColor( 1, 1, 1 )

rect.rotation = 45
print( rect.rotation )  -- Prints 45 in the terminal
``````

##### Transitional Rotation

`````lua
local rect = display.newRect( 50, 50, 100, 150 )
rect:setFillColor( 1, 0, 0 )
rect.rotation = -45
local reverse = 1

local function rockRect()
	if ( reverse == 0 ) then
		reverse = 1
		transition.to( rect, { rotation=-45, time=500, transition=easing.inOutCubic } )
	else
		reverse = 0
		transition.to( rect, { rotation=45, time=500, transition=easing.inOutCubic } )
	end
end
 
timer.performWithDelay( 600, rockRect, 0 )  -- Repeat forever
`````