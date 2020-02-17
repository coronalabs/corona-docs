
# physics.setReportCollisionsInContentCoordinates()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, collision, content, space, coordinates
> __See also__          [physics.getReportCollisionsInContentCoordinates()][api.library.physics.getReportCollisionsInContentCoordinates]<br/>[collision][api.event.collision]<br/>[preCollision][api.event.preCollision]<br/>[postCollision][api.event.postCollision]<br/>[physics.setAverageCollisionPositions()][api.library.physics.setAverageCollisionPositions]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function sets the content origin as the collision point in the [collision][api.event.collision], [preCollision][api.event.preCollision], and [postCollision][api.event.postCollision] physics events.


## Syntax

	physics.setReportCollisionsInContentCoordinates( enabled )

##### enabled ~^(required)^~
_[Boolean][api.type.Boolean]._ Sets the physics engine to return the specific collision point between two bodies, in content coordinates. This means that when two bodies collide, the `event.x` and `event.y` reported to the collision listener will equate to the exact point where collision occurred.


## Example

`````lua
-- Toggle the collision point.
if ( physics.getReportCollisionsInContentCoordinates() ) then

    physics.setReportCollisionsInContentCoordinates( false )

else

    physics.setReportCollisionsInContentCoordinates( true )

end
`````
