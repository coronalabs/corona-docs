
# Uniqueness of <nobr>Post-Collisions</nobr>

Almost every developer who uses Corona's <nobr>Box2D-based</nobr> physics engine implements some type of basic <nobr>__collision detection__ &mdash;</nobr> after all, a physics simulation without any collision events and associated game logic would be fairly lifeless.

For those developers who need even more specialized collision handling, Corona also features the [pre-collision][api.event.preCollision] listener. This is reserved for specific, dedicated handling of a collision __before__ it occurs and it's often used with the [PhysicsContact][api.type.PhysicsContact] as discussed in the [Multi-Element Collisions][tutorial.games.multiElementCollision] tutorial.

Yet a third option&nbsp;&mdash; less known but equally important in some cases&nbsp;&mdash; is the [post-collision][api.event.postCollision] listener. As the name indicates, this listener is used to gather various details of a collision __after__ it occurs. This event also provides some physical information that no other event type provides, making it especially useful in certain cases!


## Configuring <nobr>Post-Collisions</nobr>

This tutorial won't go into extensive detail on how to set up collision listeners since it's all outlined in the [Collision Detection][guide.physics.collisionDetection] guide. Basically, <nobr>post-collisions</nobr> are configured similarly to normal collisions:

``````{ brush="lua" gutter="false" first-line="1" highlight="[10,11,12,15,16]" }
-- Set up physics engine
local physics = require( "physics" )
physics.start()

-- Create a basic physics object
local box = display.newRect( 60, 20, 50, 50 )
physics.addBody( box )

-- Set up the post-collision listener function
local function postCollisionEvent( self, event )
	print( "POST-COLLISION EVENT" )
end

-- Associate the listener function with the object
box.postCollision = postCollisionEvent
box:addEventListener( "postCollision" )
``````

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Be aware that <nobr>post-collision</nobr> events are quite "noisy" and may report many times per collision contact. This may affect game performance, so you should only listen for <nobr>post-collision</nobr> events when necessary. For instance, you may consider temporarily removing the associated event listener when <nobr>post-collisions</nobr> are not a factor within the simulation:

``````lua
box:removeEventListener( "postCollision" )
box.postCollision = nil
``````

</div>
</div>


## <nobr>Post-Collision</nobr> Applications

It may seem pointless to gather details about a collision "after&nbsp;the&nbsp;fact" since the collision has already occurred and the physics engine has essentially moved to the next time step. However, it's exactly the instances where <nobr>post-collisions</nobr> __are__ important that makes them an essential part of your physics toolbox.

Let's explore some potential instances where <nobr>post-collisions</nobr> are unique and powerful:

### Detecting Collision Force

The <nobr>post-collision</nobr> event is the __only__ collision event which reports the __force__ of the collision which just occurred. This value is reported as `event.force` in the <nobr>post-collision</nobr> listener, for example:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3]" }
local function postCollisionEvent( self, event )
	print( "POST-COLLISION EVENT" )
	print( "FORCE:", event.force )
end
``````

Where might this apply in a physics simulation? Consider the classic hit Angry&nbsp;Birds<span style="font-size: 80%;"><sup>&trade;</sup></span> where each ornery avian has a different effect on different solid materials in the world&nbsp;&mdash; for example, the small blue birds strike particulary hard against "glass" blocks. If we were to implement similar game functionality, it would be easy to code a conditional check which detects if a blue bird collides with a glass block, but that limits us to a true/false relationship&nbsp;&mdash; we still wouldn't know exactly what __force__ was delivered in the collision. Using the <nobr>post-collision</nobr> event, however, we can detect the amount of force and assign damage accordingly, either shattering the glass block entirely or merely cracking it partially.

### Threshold Filtering

Collision forces are equally useful in "filtering" purposes. Consider a game where the player fires arrows at an armored enemy, for instance the armored skeleton in the [Multi-Element Collisions][tutorial.games.multiElementCollision] tutorial. In theory, the skeleton's armor has a certain threshold upon which it will block projectiles entirely, causing them to bounce off and fall to the ground. As noted above, a normal collision event can reveal that a projectile hit the skeleton, but it cannot provide details about collision __force__. Thus, the <nobr>post-collision</nobr> event once again becomes crucial&nbsp;&mdash; by implementing it, we can detect if the force is above a certain threshold and, if&nbsp;so, the arrow will penetrate the enemy's armor and deliver an appropriate amount of damage.

### Detecting Collision Friction

The <nobr>post-collision</nobr> event is also the only collision event which reports the __friction__ of the collision which just occurred. This value is reported as `event.friction` in the <nobr>post-collision</nobr> listener, for instance:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3]" }
local function postCollisionEvent( self, event )
	print( "POST-COLLISION EVENT" )
	print( "FRICTION:", event.friction )
end
``````

Where might this apply in a physics simulation? One example would be to detect the friction of a car or other object when it collides with a metal surface, then use that value to display a variable amount of "sparks" via a [particle emitter][api.library.display.newEmitter] or other means. For example, if the friction is very high, we could generate a more visible amount of sparks, while if the friction is low&nbsp;&mdash; for instance the object just barely brushed against the surface&nbsp;&mdash; we could generate just a small burst of sparks (or&nbsp;even use the filtering threshold discussed above to omit the effect&nbsp;entirely).


## Conclusion

Hopefully this tutorial has outlined some valid applications for [post-collision][api.event.postCollision] events. While detecting these will never be as common as detecting normal collisions, they are unique events which can be essential to certain game logic and even to visual realism in a game.
