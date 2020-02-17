
# collision

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          collision, physics
> __See also__          [Collision Detection][guide.physics.collisionDetection] _(guide)_
>						[preCollision][api.event.preCollision]
>						[postCollision][api.event.postCollision]
>						[physics.setAverageCollisionPositions()][api.library.physics.setAverageCollisionPositions]
>						[physics.setReportCollisionsInContentCoordinates()][api.library.physics.setReportCollisionsInContentCoordinates]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Used in conjunction with the [physics][api.library.physics] library. Physics engine collision events are exposed through the Corona event listener model with the event name of `"collision"`. In addition to standard collision events, Corona offers [preCollision][api.event.preCollision] and [postCollision][api.event.postCollision] events.

## Object References

Depending on whether collisions are detected locally or globally, references to the objects involved will vary. For more information about these two collision handling methods, see the [Collision Detection][guide.physics.collisionDetection] guide.

<div class="inner-table">

Local Collision Event		&nbsp;	Global Collision Event
--------------------------	------	--------------------------
`event.target` or `self`	&nbsp;	`event.object1`
`event.other`				&nbsp;	`event.object2`
`event.selfElement`			&nbsp;	`event.element1`
`event.otherElement`		&nbsp;	`event.element2`
--------------------------	------	--------------------------

</div>

Please compare these two example functions for reference variations:

``````lua
-- Local collision handling
local function onLocalCollision( self, event )
	print( event.target )        --the first object in the collision
	print( event.other )         --the second object in the collision
	print( event.selfElement )   --the element (number) of the first object which was hit in the collision
	print( event.otherElement )  --the element (number) of the second object which was hit in the collision
end
object.collision = onLocalCollision
object:addEventListener( "collision" )

-- Global collision handling
local function onGlobalCollision( event )
	print( event.object1 )       --the first object in the collision
	print( event.object2 )       --the second object in the collision
	print( event.element1 )      --the element (number) of the first object which was hit in the collision
	print( event.element2 )      --the element (number) of the second object which was hit in the collision
end
Runtime:addEventListener( "collision", onGlobalCollision )
``````


## Gotchas

* During the `"ended"` [phase][api.event.collision.phase], the [event.x][api.event.collision.x] and [event.y][api.event.collision.y] positions are always zero. This is a Box2D limitation.

* When a collision involves a circle and the collision result is returned in local space (see&nbsp;[physics.setReportCollisionsInContentCoordinates()][api.library.physics.setReportCollisionsInContentCoordinates]), the local space position of the collision is always `0,0`. This is a Box2D limitation.

* Currently, the Box2D physics engine is liable to crash during a collision if Corona code attempts to modify objects still involved in the collision. This is because Box2D is still working out the iterated mathematics on these objects. Please see the [Collision Detection][guide.physics.collisionDetection] guide for a list of functions and properties that are subject to this rule.


## Properties

#### [event.contact][api.event.collision.contact]

#### [event.element1][api.event.collision.element1]

#### [event.element2][api.event.collision.element2]

#### [event.name][api.event.collision.name]

#### [event.object1][api.event.collision.object1]

#### [event.object2][api.event.collision.object2]

#### [event.other][api.event.collision.other]

#### [event.otherElement][api.event.collision.otherElement]

#### [event.phase][api.event.collision.phase]

#### [event.selfElement][api.event.collision.selfElement]

#### [event.target][api.event.collision.target]

#### [event.x][api.event.collision.x]

#### [event.y][api.event.collision.y]
