
# event.x

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [collision][api.event.collision]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          collision, x
> __See also__			[event.y][api.event.collision.y]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The __x__ position where the collision event occurred. Note that the reported collision position can be influenced by [physics.setAverageCollisionPositions()][api.library.physics.setAverageCollisionPositions] and [physics.setReportCollisionsInContentCoordinates()][api.library.physics.setReportCollisionsInContentCoordinates].


## Gotchas

* During the `"ended"` [phase][api.event.collision.phase], this value will always be `0`. This is a Box2D limitation.

* If either (or&nbsp;both) bodies involved in the collision are __sensors__, this value will always be `0`. This is a Box2D limitation.

* When a collision involves a circle and the collision result is returned in local space (see&nbsp;[physics.setReportCollisionsInContentCoordinates()][api.library.physics.setReportCollisionsInContentCoordinates]), the local space position of the collision is always `0,0`. This is a Box2D limitation.


## Example

``````lua
local function onCollision( event )

	if ( event.phase == "began" ) then
		print( "began: " .. event.object1 .. " & " .. event.object2 )
		print( "position: " .. event.x .. "," .. event.y )
	elseif ( event.phase == "ended" ) then
		print( "ended: " .. event.object1 .. " & " .. event.object2 )
		print( "position: " .. event.x .. "," .. event.y )
	end
end
``````
