
# event.y

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [preCollision][api.event.preCollision]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          preCollision, y
> __See also__			[event.x][api.event.preCollision.x]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The __y__ position where the <nobr>pre-collision</nobr> event occurred. Note that the reported collision position can be influenced by [physics.setAverageCollisionPositions()][api.library.physics.setAverageCollisionPositions] and [physics.setReportCollisionsInContentCoordinates()][api.library.physics.setReportCollisionsInContentCoordinates].


## Example

``````lua
local function onPreCollision( event )
	print( "position: " .. event.x .. "," .. event.y )
end
``````
