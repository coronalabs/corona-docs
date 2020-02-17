
# event.y

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [postCollision][api.event.postCollision]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          postCollision, y
> __See also__			[event.x][api.event.postCollision.x]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The __y__ position where the <nobr>post-collision</nobr> event occurred. Note that the reported collision position can be influenced by [physics.setAverageCollisionPositions()][api.library.physics.setAverageCollisionPositions] and [physics.setReportCollisionsInContentCoordinates()][api.library.physics.setReportCollisionsInContentCoordinates].


## Example

``````lua
local function onPostCollision( event )
	print( "position: " .. event.x .. "," .. event.y )
end
``````
