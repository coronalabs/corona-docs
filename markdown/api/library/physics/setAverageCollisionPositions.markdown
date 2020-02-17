
# physics.setAverageCollisionPositions()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, collision, averaging
> __See also__          [physics.getAverageCollisionPositions()][api.library.physics.getAverageCollisionPositions]
>						[collision][api.event.collision]
>						[preCollision][api.event.preCollision]
>						[postCollision][api.event.postCollision]
>						[physics.setReportCollisionsInContentCoordinates()][api.library.physics.setReportCollisionsInContentCoordinates]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Because it's common for Box2D to report multiple collision points during a single frame iteration, this setting is useful to report those points as one averaged point. This function applies to all the contact points in the [collision][api.event.collision], [preCollision][api.event.preCollision], and [postCollision][api.event.postCollision] physics events.


## Syntax

	physics.setAverageCollisionPositions( enabled )

##### enabled ~^(required)^~
_[Boolean][api.type.Boolean]._ Enables the averaging of all contact points in a collision between physics bodies.


## Example

``````lua
-- Toggle the averaging
if ( physics.getAverageCollisionPositions() ) then

	physics.setAverageCollisionPositions( false )
else

	physics.setAverageCollisionPositions( true )
end
``````
