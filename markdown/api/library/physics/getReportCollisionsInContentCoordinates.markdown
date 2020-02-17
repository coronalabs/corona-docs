
# physics.getReportCollisionsInContentCoordinates()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, collision, content, space, coordinates
> __See also__          [physics.setReportCollisionsInContentCoordinates()][api.library.physics.setReportCollisionsInContentCoordinates]<br/>[collision][api.event.collision]<br/>[preCollision][api.event.preCollision]<br/>[postCollision][api.event.postCollision]<br/>[physics.getAverageCollisionPositions()][api.library.physics.getAverageCollisionPositions]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This function is used to determine if the content origin is the collision point in the [collision][api.event.collision], [preCollision][api.event.preCollision], and [postCollision][api.event.postCollision] physics events.

## Return

`false` (default) — One of the colliding object's __x__ and __y__ location is the collision point.

`true` — Collisions between two objects return the specific collision point, in content origin.


## Syntax

	physics.getReportCollisionsInContentCoordinates()


## Example

`````lua
-- Toggle the collision point.
if ( physics.getReportCollisionsInContentCoordinates() ) then

    physics.setReportCollisionsInContentCoordinates( false )

else

    physics.setReportCollisionsInContentCoordinates( true )

end
`````
