
# LiquidFun Particle Collisions

This tutorial outlines how to handle collisions between LiquidFun particles and Box2D rigid bodies. Handling these collisions is essential to implement a more comprehensive and responsive scenario using LiquidFun physics.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If you haven't read the [LiquidFun Essentials][tutorial.games.introLiquidFun] tutorial, please read it carefully so that you understand the basics of the LiquidFun system.

</div>
</div>


## Basic Setup

For this tutorial, we'll need to create, at the minimum, a [ParticleSystem][api.type.ParticleSystem] and another object with which the particles can collide:

``````lua
local physics = require( "physics" )
physics.start()

-- Create a platform
local platform = display.newRect( display.contentCenterX, 350, 160, 40 )
physics.addBody( platform, "static" )
platform.rotation = 10

-- Create the particle system
local testParticleSystem = physics.newParticleSystem(
{
	filename = "particle.png",
	radius = 2,
	imageRadius = 4
})

local function onTimer()

	testParticleSystem:createParticle(
	{
		x = display.screenOriginX - 10,
		y = 100,
		velocityX = 80,
		velocityY = -200,
		color = { 1, 0.2, 0.4, 1 },
		lifetime = 32.0,
		flags = { "water", "colorMixing", "fixtureContactListener" }
	})
end

timer.performWithDelay( 20, onTimer, 40 )
``````

Let's inspect this code in more detail:

1. Immediately after including and starting the physics engine, we create a static platform for the particles to collide with and rotate it 10 degrees so that we can watch the liquid flow off it.

2. Next we create the particle system using relatively basic properties.

3. With the particle system in place, we create a function (`onTimer()`). Inside this function we include a call to the [object:createParticle()][api.type.ParticleSystem.createParticle] method which generates a single particle. The properties for this call are similar to those in the [LiquidFun Essentials][tutorial.games.introLiquidFun] tutorial except for the inclusion of one __very__ important flag: `"fixtureContactListener"`. If you omit this flag, you will __not__ receive particle collision responses!

4. Finally, we queue a timer to generate 40 particles at an increment of 20 milliseconds.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

To re-emphasize the point above, you __must__ include `"fixtureContactListener"` within the `flags` table when creating a particle. If this flag is not included, you will __not__ receive particle collision responses.

</div>
</div>


## Particle System Collision Handling

Now let's add a function to listen for collision events on the particle system. This is similar to the method of local collision handling between traditional physical objects described [here][guide.physics.collisionDetection]&nbsp;&mdash; in this case, we just need to set up the function, set the particle system's `particleCollision` property to reference the function, and then add an event listener of the `"particleCollision"` type to the system.

``````lua
local function particleSystemCollision( self, event )

	if ( event.phase == "began" ) then
		print( "PARTICLE SYSTEM:", event.particleSystem )
	end
end
 
testParticleSystem.particleCollision = particleSystemCollision
testParticleSystem:addEventListener( "particleCollision" )
``````

This provides a very basic collision framework, but in most cases you'll need more information to properly react to particle collisions. Fortunately, Corona provides a considerable amount of information as [properties][api.event.particleCollision] of the `event` table of the `particleSystemCollision` listener function. These include:

* `event.name` &mdash; The string `"particleCollision"`.
* `event.phase` &mdash; One of the typical collision phases of `"began"` or `"ended"`.
* `event.object` &mdash; Reference to the object that the particle collided with.
* `event.element` &mdash; The fixture index of the other object, relevant for [multi-element bodies][guide.physics.physicsBodies#multi-element-bodies].
* `event.particleSystem` &mdash; Reference to the parent [ParticleSystem][api.type.ParticleSystem] of the colliding particle.
* `event.x` &mdash; The __x__ position of the particle that's involved in the collision.
* `event.y` &mdash; The __y__ position of the particle that's involved in the collision.
* `event.normalX` &mdash; The collision normal's __x__ direction.
* `event.normalY` &mdash; The collision normal's __y__ direction.
* `event.r` &mdash; The red color value of the particle.
* `event.g` &mdash; The green color value of the particle.
* `event.b` &mdash; The blue color value of the particle.
* `event.a` &mdash; The alpha color value of the particle.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

An critical consideration when working with LiquidFun is that actions __applied__ as a result of a particle collision can only be done upon the particle system as an entire object. In other words, when a single particle collides with another object, you can __read__ any of the above properties but you can't __set__ a property upon that specific particle, for example set its `b` value <nobr>(blue color value)</nobr> to change its color. Basically, you need to regard the particle system as a dedicated unit and not attempt to set properties on a <nobr>per-particle</nobr> basis.

</div>


## Object Collision Handling

Alternatively, you can detect collisions on other objects instead of directly on the particle system. This may be more logical if you're designing a game with multiple particle systems and you prefer to detect collisions on one primary object like a player character.

In our existing example, we can achieve this by adding a collision listener to the __platform__ object instead of the particle system. Inspect the difference:

``````{ brush="lua" gutter="false" first-line="1" highlight="[1,4,8,9]" }
local function objectCollision( self, event )

	if ( event.phase == "began" ) then
		print( "OBJECT:", event.object )
	end
end

platform.particleCollision = objectCollision
platform:addEventListener( "particleCollision" )
``````

Conveniently, this model also provides the same `event` table [properties][api.event.particleCollision] listed above, so you can gather info about the specific particle involved in the collision, including the particle system which generated it.


## Global Collision Handling

Yet another way to handle particle collisions is a global `Runtime` listener. This will detect collisions between particles and other physical objects at the global level.

``````lua
local function onGlobalCollision( event )

	if ( event.phase == "began" ) then
		print( "OBJECT:", event.object )
		print( "PARTICLE SYSTEM:", event.particleSystem )
	end
end

Runtime:addEventListener( "particleCollision", onGlobalCollision )
``````


## Conclusion

Hopefully this tutorial has illustrated how simple it is to detect collisions between LiquidFun particles and other physical objects. This feature should help take your <nobr>LiquidFun-based</nobr> games to the next level of interactivity!
