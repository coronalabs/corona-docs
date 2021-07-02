
# <nobr>Multi-Element</nobr> Collisions

This tutorial covers an important topic regarding Corona's physics engine&nbsp;&mdash; in&nbsp;specific, advanced tactics involving <nobr>multi-element</nobr> physics bodies.

First, we should define what a <nobr>__multi-element__</nobr> body is. Essentially, a <nobr>multi-element</nobr> body is a physics body composed of two or more "shapes" to create a whole. It does __not__ define a physical object that you have assembled by attaching several physical bodies with weld joints or other joints (like&nbsp;a&nbsp;ragdoll). Instead, a <nobr>multi-element</nobr> body is assembled from several shapes but it's treated as a unified, solid whole, wherein the individual elements don't move or flex.


## Why Multi-Element Bodies?

<div class="float-right" style="max-width: 295px; margin-bottom: 16px; clear: both;">

![][images.docs.multi-element-1]

</div>

This is a rehash for physics veterans, but basically, in&nbsp;Box2D, __all__ <nobr>shape-based</nobr> physical bodies must obey these rules:

1. Must be a polygonal shape of __eight&nbsp;sides&nbsp;maximum__.
2. Must __not__ include any __concave&nbsp;angles__.

This is fine for a body that you can define as a standard, convex polygon, but what about a body that can't be traced with only convex angles or can't be represented accurately in eight sides or less?

The solution is a <nobr>multi-element</nobr> body where the sprite/image is represented by __multiple__ convex shapes to create a unified body.


## Per-Element Collision Control

If you've worked with <nobr>multi-element</nobr> bodies before, you know that they provide some great capabilities, but they also present some limitations:

### Multi-Element Capabilities

Multi-element bodies have some unique capabilities which can help you overcome various design hurdles, including:

* Individual elements can have unique [collision filters][guide.physics.collisionDetection#collision-filtering]. This is useful if you want certain parts of your <nobr>multi-element</nobr> body to collide/react with __some__ but not __all__ other physical objects in the world.

* Individual elements can be set as a __sensors__, allowing all other objects to pass through them while still returning a collision detection event (this&nbsp;method is utilized in the [Allowing Jumps][tutorial.games.allowJumps]&nbsp;tutorial).

* In a collision, each element can return an integer pertaining to the <nobr>__order in which it was declared__</nobr> in the [physics.addBody()][api.library.physics.addBody] function&nbsp;&mdash; for&nbsp;example, the first element declared will return `1`, the second `2`, etc. This allows you to pinpoint which part of a <nobr>multi-element</nobr> body is involved in a collision event and take the appropriate action.

### Multi-Element Limitations

Despite the above capabilities, the following limitations remain:

* Once a collision filter is declared for an element or body, it cannot be changed during runtime.

* If an element is declared as a sensor, it cannot __individually__ be changed to a <nobr>non-sensor</nobr> <nobr>(or vice-versa)</nobr> during runtime&nbsp;&mdash; only the __entire&nbsp;body__ can be swapped between behavior as a sensor or a <nobr>non-sensor</nobr> after it has been created.

### Overcoming Limitations

Never fear, this tutorial will show you how to overcome both of the above limitations! We'll do this using the [physics contact][api.type.PhysicsContact], a feature which allows you to predetermine, via the use of a [pre-collision][api.event.preCollision] listener, what happens when the collision actually occurs. Predominantly, this is useful for voiding a collision entirely based on your app logic and we'll extend this method to <nobr>multi-element</nobr> bodies in this tutorial.

<div class="float-right" style="max-width: 200px; margin-top: 12px; margin-bottom: 16px; clear: both;">

![][images.docs.skeleton-1]

</div>

A possible usage case for this would be a multi-element "armored&nbsp;enemy" like the image shown here. In a theoretical game, the hero must attack this enemy and destroy individual pieces of its armor (helmet,&nbsp;chest&nbsp;plate, shield,&nbsp;etc.) to break through to the bones within. A scenario such as this requires a unique approach because the "traditional" methods are prone to these issues:

* While the enemy could potentially be constructed from several individual and distinct bodies, then assembled using [weld joints][guide.physics.physicsJoints#weld-joint], this creates another level of complexity in the enemy assembly, and it may cause some degree of physical instability which is inherent even with weld joints.

* As noted above, individual elements of a <nobr>multi-element</nobr> body can be __initially__ set as sensors (or&nbsp;not), but it's <nobr>"all or nothing"</nobr> when using [object.isSensor][api.type.Body.isSensor] on the body after creating it. Thus, you can __not__ set just one "destroyed" armor piece as a sensor while ensuring the others retain physical response, for example causing projectiles to physically bounce off.

For these reasons, we turn to the [physics contact][api.type.PhysicsContact] in conjunction with <nobr>per-element</nobr> collision detection to overcome our "destructible&nbsp;armor" hurdle.

### Assembling the Body

Let's examine how to create a <nobr>multi-element</nobr> body for this enemy. Essentially, the approach is this:

1. Display the enemy object on the screen.
2. Define the shapes for the body, starting at the head and basically working down for convenience.
3. Add the physical body and pass each shape to the [physics.addBody()][api.library.physics.addBody] call in an ordered list of elements.

``````{ brush="lua" gutter="true" first-line="1" highlight="[7,8,10,11,12,13,14,15,16,17,18,20,21,22,23,24,25,26,27,28,30]" }
-- Set up physics engine
local physics = require( "physics" )
physics.start()
physics.setDrawMode( "normal" )
physics.setGravity( 0,0 )

local armoredSkeleton = display.newImageRect( "skeleton.png", 200, 256 )
armoredSkeleton.x, armoredSkeleton.y = display.contentCenterX, display.contentCenterY

local armorPieces = {
	helmet = { -38,-103,-26,-118,-15,-120,-4,-118,8,-103,8,-63,-38,-63 },
	mantle = { -68,-55,-52,-63,20,-63,37,-55,47,-44,55,-20,-89,-20,-80,-44 },
	chest = { 44,-44,54,54,-85,54,-76,-44 },
	shield = { 88,-10,98,13,86,65,98,42,66,80,41,86,41,-33,66,-28 },
	faulds = { 48,54,53,80,-87,80,-85,54 },
	legLeft = { -34,80,-34,127,-72,127,-72,80 },
	legRight = { 43,80,43,127,5,127,5,80 }
}

physics.addBody( armoredSkeleton, "dynamic",
	{ shape = armorPieces["helmet"] },
	{ shape = armorPieces["mantle"] },
	{ shape = armorPieces["chest"] },
	{ shape = armorPieces["shield"] },
	{ shape = armorPieces["faulds"] },
	{ shape = armorPieces["legLeft"] },
	{ shape = armorPieces["legRight"] }
)

local armorStates = { true, true, true, true, true, true, true }
``````

Note that on line&nbsp;30, we also declare a simple `armorStates` table to keep track of the "state" of each individual armor object. This will be used to determine if a particular element is <nobr>__on__ or __off__ &mdash;</nobr> or to put it another way, to determine whether an armor element is "intact" or "destroyed" in game collision logic. For this we can use a simple <nobr>non-indexed</nobr> table of 7 boolean values <nobr>(7 armor pieces)</nobr>, all initially set to `true`.

<div class="float-right" style="max-width: 230px; margin-top: 12px; margin-bottom: 16px; clear: both;">

![][images.docs.skeleton-2]

</div>

If you set the physics draw mode to `"hybrid"` (line&nbsp;4) and run this code, the skeleton will look something like the image here. Note that some of the armor pieces overlap other pieces&nbsp;&mdash; that is perfectly acceptable in this scenario because the player will still need to destroy individual pieces <nobr>one-by-one</nobr>.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

The __order of declaration__ of body elements <nobr>(lines 21-27)</nobr> should be noted for later, as it will pertain to the __integer__ of the specific element returned during collision detection. Knowing this integer and which body element it relates to is crucial when expanding upon this basic scenario&nbsp;&mdash; for&nbsp;instance, if you know that the helmet was struck, you may want to change the skeleton image/sprite to a frame where it visually has no helmet, or you might want to deal extra damage based on a "head&nbsp;hit" versus a "leg&nbsp;hit."

</div>

### Pre-Collision Listener

Next, we'll declare the basic [pre-collision][api.event.preCollision] listener. This type of listener __must__ be used if we intend to utilize the [physics contact][api.type.PhysicsContact], because we'll be telling Corona to manage the collision state immediately __before__ it occurs, not __when__ it occurs.

``````{ brush="lua" gutter="true" first-line="32" }
local function skeletonHit( self, event )

	print( event.selfElement )
end
 
armoredSkeleton.preCollision = skeletonHit
armoredSkeleton:addEventListener( "preCollision" )
``````

This function accomplishes just the basics. Anything that collides with the skeleton will return the corresponding __integer__ of the specific body element as `event.selfElement`, according to the order in which they were declared. So, because we declared the helmet as the first element, a collision involving it will return `1`. A collision with the mantle will return `2`, a collision with the chest will return `3`, and so forth.

### Using the Physics Contact

At this point, the `skeletonHit()` function will tell us which specific armor piece is involved in a collision, but nothing more. That doesn't reach our goal, so let's expand it to access the `armorStates` table and determine if a collision should occur or not:

``````{ brush="lua" gutter="true" first-line="32" highlight="[34,35,36,37,38,39,40,41]" }
local function skeletonHit( self, event )

	-- Dictate the collision behavior based on the armor element state
	if ( armorStates[event.selfElement] == false ) then
		-- Use physics contact to void collision
		event.contact.isEnabled = false
	else
		-- Set the associated armor element state to "destroyed"
		armorStates[event.selfElement] = false
    end
end

armoredSkeleton.preCollision = skeletonHit
armoredSkeleton:addEventListener( "preCollision" )
``````

Basically, if the armor element is "destroyed" in our game logic (line&nbsp;35), we can use the physics contact (`event.contact`) to instruct Corona to void the collision entirely, making it appear as if that element doesn't even exist (our&nbsp;ultimate&nbsp;purpose). In contrast, if the armor element is still intact, we allow the collision to occur naturally but we toggle its state to "destroyed" by setting its index within the `armorStates` table to `false`&nbsp;&mdash; this will ensure that the armor element does __not__ cause a physical response upon the __next__ collision event.

That's basically it! With this code, each individual armor piece can be toggled from an active state to an inactive state, letting you control your game logic at a <nobr>fine-tuned</nobr> level while still utilizing a single unified physics body.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If you really want to get creative, consider expanding this concept to <nobr>__armor health levels__</nobr>. In the scenario above, just __one__ hit to any particular armor piece will "destroy" it, but that's not very realistic&nbsp;&mdash; after&nbsp;all, shouldn't armor be able to absorb some amount of damage before it's destroyed?

One way to accomplish this is to use integer health values <nobr>(not boolean `true`/`false`)</nobr> for each armor piece within the `armorStates` table. Note that we set a higher value for the chest piece (third&nbsp;value) compared to weaker pieces like the legs <nobr>(sixth and seventh values)</nobr>:

``````{ brush="lua" gutter="true" first-line="30" highlight="[30]" }
local armorStates = { 10, 5, 20, 15, 8, 5, 5 }
``````

Next, adjust the `skeletonHit()` function to handle __integers__ instead of boolean `true`/`false` values:

``````{ brush="lua" gutter="true" first-line="32" highlight="[35,40]" }
local function skeletonHit( self, event )

	-- Dictate the collision behavior based on the armor element state
	if ( armorStates[event.selfElement] == 0 ) then
		-- Use physics contact to void collision
		event.contact.isEnabled = false
	else
		-- Subtract 1 from the armor piece's health value
		armorStates[event.selfElement] = armorStates[event.selfElement] - 1
    end
end
``````

Essentially, on line&nbsp;35, instead of checking for a value of `false`, we check for a <nobr>value of `0` &mdash;</nobr> this indicates that the "health" of the armor piece has been reduced to nothing and it can be considered destroyed. Additionally, on line&nbsp;40, we subtract `1` from the piece's health instead of setting it to `false` as in the original version.

</div>
</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Yet another creative option is to detect collision __forces__ upon the skeleton's armor, dealing more damage based on how hard/fast a projectile strikes a piece of armor. This method is outlined in more detail in the [Uniqueness of Post-Collisions][tutorial.games.postCollision] tutorial.

</div>
</div>


## Conclusion

As you've learned in this tutorial, <nobr>mutli-element</nobr> physics bodies possess some valuable traits that <nobr>joint-assembled</nobr> bodies don't, but they also present some hurdles. Hopefully these tips have shown you how to overcome those in your <nobr>physics-based</nobr> apps!


<!--- LEGAL -->

##

<div class="tiny-copy">

Character art in this tutorial is courtesy of [Ponywolf](https://ponywolf.com), creator of amazing <nobr>open-source</nobr> game templates like [Match 3 Space RPG](https://github.com/coronalabs/Match-Three-Space-RPG), [Sticker Knight Platformer](https://github.com/coronalabs/Sticker-Knight-Platformer/), and [Endless Sk8boarder](https://github.com/coronalabs/Endless-Skateborder).

</div>
