
# physics.getAverageCollisionPositions()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, collision, averaging
> __See also__          [physics.setAverageCollisionPositions()][api.library.physics.setAverageCollisionPositions]
>						[collision][api.event.collision]
>						[preCollision][api.event.preCollision]
>						[postCollision][api.event.postCollision]
>						[physics.getReportCollisionsInContentCoordinates()][api.library.physics.getReportCollisionsInContentCoordinates]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

It's common for Box2D to report multiple contact points during a single iteration of a simulation. This function is use to determine if averaging of all the contact points is enabled.

This function returns `false` (default) if the point of contact reported is the first one reported by Box2D (the&nbsp;order is&nbsp;arbitrary). This function returns `true` if the point of contact reported is the average of all the contact points.


## Syntax

	physics.getAverageCollisionPositions()

## Example

`````lua
-- Toggle the averaging
if ( physics.getAverageCollisionPositions() ) then

	physics.setAverageCollisionPositions( false )
else

	physics.setAverageCollisionPositions( true )
end
`````
