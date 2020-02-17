
# preCollision

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          preCollision, physics
> __See also__          [Collision Detection][guide.physics.collisionDetection] _(guide)_
>						[collision][api.event.collision]
>						[postCollision][api.event.postCollision]
>						[physics.setAverageCollisionPositions()][api.library.physics.setAverageCollisionPositions]
>						[physics.setReportCollisionsInContentCoordinates()][api.library.physics.setReportCollisionsInContentCoordinates]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Used in conjunction with the [physics][api.library.physics] library. Physics engine <nobr>pre-collision</nobr> events are exposed through the Corona event listener model with the event name of `"preCollision"`. In addition to these events and standard [collision][api.event.collision] events, Corona offers [postCollision][api.event.postCollision] events.


## Object References

Depending on whether pre-collisions are detected locally or globally, references to the objects involved will vary. For more information about these two collision handling methods, see the [Collision Detection][guide.physics.collisionDetection] guide.

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
-- Local preCollision handling
local function onLocalPreCollision( self, event )
	print( event.target )        --the first object in the collision
	print( event.other )         --the second object in the collision
	print( event.selfElement )   --the element (number) of the first object which was hit in the collision
	print( event.otherElement )  --the element (number) of the second object which was hit in the collision
end
object.preCollision = onLocalPreCollision
object:addEventListener( "preCollision" )

-- Global preCollision handling
local function onGlobalPreCollision( event )
	print( event.object1 )       --the first object in the collision
	print( event.object2 )       --the second object in the collision
	print( event.element1 )      --the element (number) of the first object which was hit in the collision
	print( event.element2 )      --the element (number) of the second object which was hit in the collision
end
Runtime:addEventListener( "preCollision", onGlobalPreCollision )
``````


## Gotchas

Physics engine <nobr>pre-collision</nobr> events are quite "noisy" and may report many times per contact, potentially affecting performance. Therefore, you should only listen for these events if you truly need <nobr>pre-collision</nobr> detection. We also recommend that you use local listeners within the objects of interest rather than listening globally to all `"preCollision"` events in the physics world.


## Properties

#### [event.contact][api.event.preCollision.contact]

#### [event.element1][api.event.preCollision.element1]

#### [event.element2][api.event.preCollision.element2]

#### [event.name][api.event.preCollision.name]

#### [event.object1][api.event.preCollision.object1]

#### [event.object2][api.event.preCollision.object2]

#### [event.other][api.event.preCollision.other]

#### [event.otherElement][api.event.preCollision.otherElement]

#### [event.selfElement][api.event.preCollision.selfElement]

#### [event.target][api.event.preCollision.target]

#### [event.x][api.event.preCollision.x]

#### [event.y][api.event.preCollision.y]
