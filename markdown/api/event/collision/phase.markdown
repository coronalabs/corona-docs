
# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [collision][api.event.collision]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          collision, phase, physics
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates the collision phase for the physics collision listener:

* `"began"` &mdash; indicates that a collision between two bodies has started initial contact.
* `"ended"` &mdash; indicates that a collision between two bodies has completed.

## Example
 
``````lua
local function onCollision( event )
	if ( event.phase == "began" ) then
		print( "began: " .. event.object1 .. " & " .. event.object2 )
	elseif ( event.phase == "ended" ) then
		print( "ended: " .. event.object1 .. " & " .. event.object2 )
	end
end
``````