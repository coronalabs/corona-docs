
# Collision Detection

This guide discusses how to handle collisions between physical objects, or ignore (filter) collisions between specific object sets.

<div class="guides-toc">

* [Collision Events](#collisionevents)
* [Collision Handling](#handling)
* [Multi-Element Collisions](#multielement)
* [Ray Casting](#raycasting)
* [Physics Contacts](#contact)
* [Collision Force/Friction](#forces)
* [Collision Filtering](#filtering)

</div>


<a id="collisionevents"></a>

## Collision Events

Physics engine collision events are exposed through the standard Corona event listener model with three types:

### collision

For general collision detection, you should listen for an event named `"collision"` \([reference][api.event.collision]\). The `"collision"` event includes phases for `"began"` and `"ended"` which signify the moments of initial contact and broken contact. If you do not implement a `"collision"` listener, this event will not fire.

### preCollision

The `"preCollision"` event \([reference][api.event.preCollision]\) fires directly before the objects start to interact. This event is often used in conjunction with the [physicsContact](#contact) outlined below.

Note that [preCollision][api.event.preCollision] events are quite "noisy" and may report many times per contact, potentially affecting performance. Therefore, you should only listen for these events if you truly need <nobr>pre-collision</nobr> detection. We also recommend that you use local listeners on the objects of interest rather than listening globally to all `"preCollision"` events in the physics world.

### postCollision

The `"postCollision"` event \([reference][api.event.postCollision]\) fires directly after the objects have interacted. This is the only event in which the collision force and friction is reported. See the [collision force/friction](#forces) section below for more on this topic. If you do not implement a `"postCollision"` listener, this event will not fire.

Like `"preCollision"` events, [postCollision][api.event.postCollision] events are quite "noisy" and may report many times per contact, potentially affecting performance. Therefore, you should only listen for these events if you truly need <nobr>post-collision</nobr> detection. We also recommend that you use local listeners on the objects of interest rather than listening globally to all `"postCollision"` events in the physics world.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Some body types <nobr>will — or will not — collide</nobr> with other body types. In a collision between two physical objects, at least __one__ of the objects must be dynamic, since this is the only body type which collides with any other type. See the [Physics&nbsp;Bodies][guide.physics.physicsBodies] guide for details on body types.

</div>
</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Currently, the Box2D physics engine is liable to crash during a collision if Corona code attempts to modify objects still involved in the collision. This is because Box2D is still working out the iterated mathematics on these objects. However, your collision handler may set a flag or include a time delay via [timer.performWithDelay()][api.library.timer.performWithDelay] so that the action can occur in the next application cycle or later.

Complete removal of object(s) via [display.remove()][api.library.display.remove] or [object:removeSelf()][api.type.DisplayObject.removeSelf] can be executed during the same collision event time step, but the following APIs and methods can __not__ be called during a collision event:

<div style="float: left; margin-right: 50px;">

* [object.bodyType][api.type.Body.bodyType]
* [object:rotate()][api.type.DisplayObject.rotate]
* [object.rotation][api.type.DisplayObject.rotation]
* [object:translate()][api.type.DisplayObject.translate]
* [object.x][api.type.DisplayObject.x]
* [object.y][api.type.DisplayObject.y]

</div>

* [physics.addBody()][api.library.physics.addBody]
* [physics.removeBody()][api.library.physics.removeBody]
* [physics.newJoint()][api.library.physics.newJoint]
* [physics.newParticleSystem()][api.library.physics.newParticleSystem]
* [physics.setContinuous()][api.library.physics.setContinuous]
* [physics.stop()][api.library.physics.stop]

</div>

<div class="guide-notebox">
<div class="notebox-title">Propagation Rules</div>

Collision events in Corona have a propagation model similar to touch events. You can use this to further optimize your game performance by limiting the number of events that are created. By default, a collision between two objects will fire a local event for the first object, then a local event for the second object, then a global event in the Runtime object, assuming all have active listeners enabled. However, you may only be interested in some of this information.

Any collision event handler that returns `true` will stop further propagation of that collision event, even if there are further listeners that would otherwise have received it. This allows you to further limit the number of events that are created and passed to the Lua side. While individual events are not very expensive, large numbers of them can affect overall performance, so limiting event propagation is a good practice.

</div>




<a id="handling"></a>

## Collision Handling

Collisions are reported between pairs of objects, and they can be detected either __locally__ on an object, using an object listener, or __globally__ using a runtime listener.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

When working with Corona [display&nbsp;groups][guide.graphics.group] and Box2D, it's important to remember that Box2D expects all physics objects to share a __global&nbsp;coordinate&nbsp;system__. Both grouped and ungrouped display objects will work well since they will share the internal coordinates of that group. However, unexpected results will occur if physical objects are added to different display groups and those groups are moved, scaled, or rotated independently of each other. As a general rule, do __not__ alter the position, scale, or rotation of display groups that contain physics objects. See [Physics Notes/Limitations][guide.physics.limitations]

</div>

### Local Collision Handling

Local collision handling is best utilized in a <nobr>one-to-many</nobr> collision scenario, for example one player object which may collide with multiple enemies, <nobr>power-ups</nobr>, etc. For local collision handling, each collision event includes a `self` table ID, representing the object itself, and `event.other` which contains the table ID of the other Corona display object involved in the collision. Because Corona display objects behave like Lua tables, you may freely add arbitrary data to these tables such as names, category designators, point values, or even stored functions, and then retrieve this data at collision time. For example, you may wish to store object names in an <nobr>easily-accessible</nobr> string format.

``````lua
local crate1 = display.newImage( "crate.png" )
physics.addBody( crate1, { density=3.0, friction=0.5, bounce=0.3 } )
crate1.myName = "first crate"
 
local crate2 = display.newImage( "crate.png" )
physics.addBody( crate2, { density=3.0, friction=0.5, bounce=0.3 } )
crate2.myName = "second crate"
 
local function onLocalCollision( self, event )

	if ( event.phase == "began" ) then
		print( self.myName .. ": collision began with " .. event.other.myName )

	elseif ( event.phase == "ended" ) then
		print( self.myName .. ": collision ended with " .. event.other.myName )
	end
end

crate1.collision = onLocalCollision
crate1:addEventListener( "collision" )

crate2.collision = onLocalCollision
crate2:addEventListener( "collision" )
``````

### Global Collision Handling

Global collision handling is best utilized in a <nobr>many-to-many</nobr> collision scenario, for example multiple hero characters which may collide with multiple enemies. For global collision handling, each collision event includes `event.object1` and `event.object2` which indicate the references to the two objects involved. Again, you may wish to store each object's name in string format and retrieve it during the collision event.

``````lua
local crate1 = display.newImage( "crate.png", 100, 200 )
physics.addBody( crate1, { density = 1.0, friction = 0.3, bounce = 0.2 } )
crate1.myName = "first crate"

local crate2 = display.newImage( "crate.png", 100, 120 )
physics.addBody( crate2, { density = 1.0, friction = 0.3, bounce = 0.2 } )
crate2.myName = "second crate"

local function onGlobalCollision( event )

	if ( event.phase == "began" ) then
		print( "began: " .. event.object1.myName .. " and " .. event.object2.myName )

	elseif ( event.phase == "ended" ) then
		print( "ended: " .. event.object1.myName .. " and " .. event.object2.myName )
	end
end

Runtime:addEventListener( "collision", onGlobalCollision )
``````

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

When detecting collisions with the global method, there is no way to determine which is the "first" and "second" object involved in the collision. In other words, `event.object1` and `event.object2` may be `crate1` and `crate2` respectively, or they might be flipped around. Thus, if you are comparing the two objects in a conditional statement, you may need to build a <nobr>multi-conditional</nobr> clause to detect both possibilities.

</div>
</div>




<a id="multielement"></a>

## Multi-Element Collisions

Collision events involving a <nobr>multi-element</nobr> body <nobr>(see the [Physics&nbsp;Bodies][guide.physics.physicsBodies] guide)</nobr> also return the specific body part involved in the collision. This allows for more <nobr>finely-tuned</nobr> game logic&nbsp;&mdash; for example, you may decide that an object colliding with the nose of a rocket does more damage than colliding with its tail fins.

For a <nobr>multi-element</nobr> body, its elements are identified by a numerical __index__ where the first element added to the body is given the number `1`, the second one is number `2`, the third is number `3`, and so on. During a collision event involving at least one <nobr>multi-element</nobr> body, the following properties are returned:

For __local__ collision events, two additional integer values are returned:

1. `event.selfElement`
2. `event.otherElement`

Similarly, __global__ collision events return two additional values:

1. `event.element1`
2. `event.element2`

In each case, these values will indicate the __index__ of the __body&nbsp;element__ involved in the collision. For example, assume that one object is a rocket with three body elements: nose, cockpit, and tail. Also assume that the body elements were configured in that specific order: nose&nbsp;first, cockpit&nbsp;second, and tail&nbsp;last. If a collision occurs on its tail, the value of `event.selfElement` will be `3`. If a collision occurs on its cockpit, the value of `event.selfElement` will be `2`.




<a id="raycasting"></a>

## Ray Casting

Corona includes built-in support for __ray&nbsp;casting__. This allows you to transmit a <nobr>ray &mdash; a straight line &mdash;</nobr> from one point to another point, using it to detect if one or more physics bodies resides in that path. For details on implementing ray casting, please see the [Ray Casting and Reflection][tutorial.games.rayCasting] tutorial.




<a id="contact"></a>

## Physics Contacts

The [physicsContact][api.type.PhysicsContact] is created by Box2D to manage/override collision behavior in special cases. Typically used in [preCollision][api.event.preCollision] event detection, this allows you to override certain properties of the collision or even void the collision entirely. 

For example, in a platform game, you may wish to construct <nobr>one-sided</nobr> platforms that the character can jump vertically through, but only from below. You may do this by comparing the character and platform position to see if the character is below the platform, and then void the collision entirely by setting [event.contact.isEnabled][api.type.PhysicsContact.isEnabled] to `false` in the [preCollision][api.event.preCollision] event handler.

The physics contact can also be used to modify the bounce and friction of the collision independently of the body's inherent settings. For instance, using a [preCollision][api.event.preCollision] event listener, you can conditionally check if two specific object types collide and then either increase or decrease the bounce or friction via [event.contact.bounce][api.type.PhysicsContact.bounce] or [event.contact.friction][api.type.PhysicsContact.friction] respectively. One actual example of this may be a "pinball" game where the [physicsContact][api.type.PhysicsContact] could be used to achieve the following:

* Balls collide with __red__ bumpers for extreme bounce (set [event.contact.bounce][api.type.PhysicsContact.bounce] to `1`)
* Balls collide with __blue__ bumpers for no bounce (set [event.contact.bounce][api.type.PhysicsContact.bounce] to `0`)
* Balls collide with all other bumpers for normal bounce (allow collision to use default behavior)




<a id="forces"></a>

## Collision Force/Friction

Once a collision has occurred, you can use [postCollision][api.event.postCollision] event detection to obtain the direct force of the collision, along with the sideways force between the two objects, which is effectively a frictional force.

The direct force of the collision is reported within the `"postCollision"` event as `event.force`, and the frictional force is available as `event.friction`:

``````lua
local function onPostCollision( self, event )

	if ( event.force > 1.0 ) then
		print( "force: " .. event.force )
		print( "friction: " .. event.friction )
	end
end

object.postCollision = onPostCollision
object:addEventListener( "postCollision" )
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

In the example above, very small forces are conditionally filtered out with <nobr>`event.force > 1.0`</nobr>. This conditional logic can be used to perform an action only when the collision force is higher than a certain threshold&nbsp;&mdash; for instance, you may decide that a game character only takes damage when a projectile strikes it with enough force. Filtering is also important because `"postCollision"` events register a series of increasingly tiny forces while the objects "settle" and it's usually best to ignore force reports below the chosen threshold.

</div>
</div>




<a id="filtering"></a>

## Collision Filtering

In some cases, you may want to completely void collision interaction between certain objects. For instance, bullets fired from a player should obviously collide with enemies, but there's usually no need to have bullets collide with <nobr>power-ups</nobr>. In Corona, there are two ways to accomplish this:

### categoryBits/maskBits

This method involves assigning `categoryBits` and `maskBits` to your objects via a "collision&nbsp;filter" definition, an optional table assigned to the `filter` key during body construction. An object will only collide with other objects if their `categoryBits` are among its assigned `maskBits`. Normally, an object will only have one category bit assigned, but may have one or more mask bits depending on what other things it should collide with.

In the example below, `redCollisionFilter` has a `maskBits` value of `3`. This filter is applied to the `redSquare` object, so `redSquare` will only collide with objects that have category bits of `1` or `2`&nbsp;&mdash; in this case, that includes other red squares (`categoryBits=2`) and the floor (`categoryBits=1`). Meanwhile, it will pass through any blue squares (`categoryBits=4`), since bit `4` is not included in its `maskBits` value.

``````lua
local floorCollisionFilter = { categoryBits=1, maskBits=6 }  -- Floor collides only with 2 and 4
local redCollisionFilter = { categoryBits=2, maskBits=3 }    -- Red collides only with 1 and 2
local blueCollisionFilter = { categoryBits=4, maskBits=5 }   -- Blue collides only with 1 and 4

local floor = display.newRect( 0, 0, 320, 80 )
physics.addBody( floor, "static", { bounce=0.8, filter=floorCollisionFilter } )

local redSquare = display.newRect( 0, 80, 40, 40 )
redSquare:setFillColor( 1, 0, 0 )
physics.addBody( redSquare, { friction=0, filter=redCollisionFilter } )
 
local blueSquare = display.newRect( 80, 80, 40, 40 )
blueSquare:setFillColor( 0, 0, 1 )
physics.addBody( blueSquare, { friction=0, filter=blueCollisionFilter } )
``````

### Collision Filter Worksheet

Collision filter values can be calculated using a simple <nobr>cross-reference</nobr> worksheet. Consider the following example based on the classic arcade game "Asteroids" which had four basic object types which could potentially collide: the player, asteroids, aliens, and bullets fired from the player.

<div style="max-width: 740px; margin-top: 10px;">

![][images.simulator.collision-chart]

</div>

1. Observe the numbers in the uppermost row: `1` to `512` in binary progression. These "bit" values are the essential aspect in determining collision filter values. For complex games, you can continue past `512` &mdash; up to `32768` (16&nbsp;columns) if necessary &mdash; but 10 columns is enough for most games.

2. Now observe the rows for each object type. Since each object type must have two values for its collision filter <nobr>(`categoryBits` and `maskBits`)</nobr>, each row is <nobr>sub-divided</nobr> into __category__ and __collides&nbsp;with__.

3. For each object type in the game, pick __one__ bit number from the uppermost row and mark a circled <span style="font-size:135%;">__&otimes;__</span> in its associated __category__ <nobr>sub-row.</nobr> This number should be unique for each object type &mdash; do __not__ use the same category number for multiple object types.

4. Next, decide if each object type can collide with other objects of the __same__ type. If true, mark an __x__ directly below the <span style="font-size:135%;">__&otimes;__</span> in the __collides&nbsp;with__ <nobr>sub-row.</nobr> In this example, notice that asteroids should collide with other asteroids and aliens should collide with other aliens, but bullets should not collide with other bullets.

5. Next, for each object type, inspect __all__ other object types both above and below its row. If the object type should collide with any other object type, mark an __x__ in the __collides&nbsp;with__ <nobr>sub-row</nobr> of the other type. Remember to keep each __x__ in the same column as the __category__ bit value (<span style="font-size:135%;">__&otimes;__</span>) that you chose for the object type.

6. Note that collision filters work in "reflex" and you must consider all colliding object types in association. For example, asteroids and aliens should collide with bullets, so it may be tempting to mark an __x__ for each of these in the bullet __collides&nbsp;with__ row and then stop the process. However, you must also mark an __x__ in the bullet's bit number column for both asteroids and aliens. If you fail to consider object types in this association, collision filters will not function properly!

7. When all object types are complete, work through the chart row by row to determine the __sum__ column values. For each <nobr>sub-row,</nobr> add (sum) the total bit value of all marks. For example, the player __collides&nbsp;with__ <nobr>sub-row</nobr> has an __x__ in bit columns `2` and `4`, so the correct __sum__ value is `6`.

8. When all sum values are calculated, simply set the `categoryBits` value for the collision filter to the __category__ sum. Similarly, set the `maskBits` value of the filter to the __collides&nbsp;with__ sum. For example, the player object filter with sums of `1` and `6` may be configured as follows:

<div class="code-indent">

``````lua
local playerCollisionFilter = { categoryBits=1, maskBits=6 }
``````

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If you add additional game elements later, you must work through the entire chart again <nobr>(all object types)</nobr> because if the new object type should collide with any previous object types, values may change for those previous object types. As such, it's recommended that you declare your filters as Lua variables which can be accessed by multiple game objects, regardless of when and where you create them.

</div>

### groupIndex

An alternative collision filtering method is to assign a `groupIndex` to each object. This value can be a positive or negative integer and it may be a simpler way of specifying collision rules. Objects with the same positive `groupIndex` value will always collide with each other, and objects with the same negative `groupIndex` value will never collide with each other.

``````lua
local greenCollisionFilter = { groupIndex = -2 }
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If both `groupIndex` and `collisionBits`/`maskBits` are assigned to an object, the `groupIndex` has higher precedence.

</div>
</div>
