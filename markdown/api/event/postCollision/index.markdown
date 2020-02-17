
# postCollision

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          postCollision, physics
> __See also__          [Collision Detection][guide.physics.collisionDetection] _(guide)_
>						[collision][api.event.collision]
>						[preCollision][api.event.preCollision]
>						[physics.setAverageCollisionPositions()][api.library.physics.setAverageCollisionPositions]
>						[physics.setReportCollisionsInContentCoordinates()][api.library.physics.setReportCollisionsInContentCoordinates]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Used in conjunction with the [physics][api.library.physics] library. Physics engine <nobr>post-collision</nobr> events are exposed through the Corona event listener model with the event name of `"postCollision"`. In addition to these events and standard [collision][api.event.collision] events, Corona offers [preCollision][api.event.preCollision] events.


## Object References

Depending on whether post-collisions are detected locally or globally, references to the objects involved will vary. For more information about these two collision handling methods, see the [Collision Detection][guide.physics.collisionDetection] guide.

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
-- Local postCollision handling
local function onLocalPostCollision( self, event )
	print( event.target )        --the first object in the collision
	print( event.other )         --the second object in the collision
	print( event.selfElement )   --the element (number) of the first object which was hit in the collision
	print( event.otherElement )  --the element (number) of the second object which was hit in the collision
end
object.postCollision = onLocalPostCollision
object:addEventListener( "postCollision" )

-- Global postCollision handling
local function onGlobalPostCollision( event )
	print( event.object1 )       --the first object in the collision
	print( event.object2 )       --the second object in the collision
	print( event.element1 )      --the element (number) of the first object which was hit in the collision
	print( event.element2 )      --the element (number) of the second object which was hit in the collision
end
Runtime:addEventListener( "postCollision", onGlobalPostCollision )
``````


## Gotchas

Physics engine <nobr>post-collision</nobr> events are quite "noisy" and may report many times per contact, potentially affecting performance. Therefore, you should only listen for these events if you truly need <nobr>post-collision</nobr> detection. We also recommend that you use local listeners within the objects of interest rather than listening globally to all `"postCollision"` events in the physics world.


## Properties

#### [event.contact][api.event.postCollision.contact]

#### [event.element1][api.event.postCollision.element1]

#### [event.element2][api.event.postCollision.element2]

#### [event.force][api.event.postCollision.force]

#### [event.friction][api.event.postCollision.friction]

#### [event.name][api.event.postCollision.name]

#### [event.object1][api.event.postCollision.object1]

#### [event.object2][api.event.postCollision.object2]

#### [event.other][api.event.postCollision.other]

#### [event.otherElement][api.event.postCollision.otherElement]

#### [event.selfElement][api.event.postCollision.selfElement]

#### [event.target][api.event.postCollision.target]

#### [event.x][api.event.postCollision.x]

#### [event.y][api.event.postCollision.y]
