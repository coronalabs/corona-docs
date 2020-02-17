
# event.x

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [postCollision][api.event.postCollision]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          postCollision, x
> __See also__			[event.y][api.event.postCollision.y]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The __x__ position where the <nobr>post-collision</nobr> event occurred. Note that the reported collision position can be influenced by [physics.setAverageCollisionPositions()][api.library.physics.setAverageCollisionPositions] and [physics.setReportCollisionsInContentCoordinates()][api.library.physics.setReportCollisionsInContentCoordinates].


## Example

``````lua
local function onPostCollision( event )
	print( "position: " .. event.x .. "," .. event.y )
end
``````
