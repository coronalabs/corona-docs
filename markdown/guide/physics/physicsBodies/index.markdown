# Physics Bodies

This guide discusses how to create Box2D physical bodies in your Corona app, including polygonal and <nobr>multi-element</nobr> bodies.

<div class="guides-toc">

* [Overview](#overview)
* [Creating Bodies](#create)
* [Destroying Bodies](#destroy)
* [Sensors](#sensors)
* [Body Properties](#properties)
* [Body Methods](#methods)

</div>


<a id="overview"></a>

## Overview

The physics world is based on the interactions of physical bodies. Corona treats these physical bodies as an extension of its graphics objects. These bodies can be bound to Corona [display&nbsp;objects][guide.media.displayObjects] in a <nobr>one-to-one</nobr> relationship and Corona will automatically handle all position updates and other synchronization tasks.

Standard object read/write attributes like `x`, `y`, and `rotation` should continue to work normally on physical bodies. However, if the object's `bodyType` is dynamic, the physics engine may "fight&nbsp;back" against your attempts to move the object manually, since it may be under the constant effect of gravity or other forces.

A display object with a physical body can be deleted in the usual way, using either [object:removeSelf()][api.type.DisplayObject.removeSelf] or [display.remove()][api.library.display.remove]. In this case, it will be removed from both the visible screen __and__ the physical simulation (the physical body data will be destroyed). Alternatively, you can use [physics.removeBody()][api.library.physics.removeBody] to remove just the physical body while retaining the core display object on screen. See [Destroying&nbsp;Objects](#destroy) for more details and an important note regarding collisions.

<!---

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

When you turn a display object into a physical object, the physics engine owns the object and applies its own rules. The engine assumes the anchor point of the object is its __center__, so changing the anchor point may change the object's position as a display object, but not in respect to the physics simulation.

The same applies to scaling the object: you can scale the object up or down, but the physics engine still considers the core physical body as it was before the scaling was applied.

Note that the physics engine's "view" of the object can be seen by setting the draw mode to either `"hybrid"` or `"debug"`.

``````lua
physics.setDrawMode( "hybrid" )
``````
``````lua
physics.setDrawMode( "debug" )
``````

</div>

-->




<a id="create"></a>

## Creating Bodies

All physical bodies in Corona are created with the [physics.addBody()][api.library.physics.addBody] function. This allows you to turn any Corona display object into a simulated physical object with just one line of code, including the assignment of physical properties.

``````lua
physics.addBody( object, { properties } )
``````

### Physical Properties

All physical bodies possess three core properties, and each can be defined as a key-value pair in the properties table. These properties are optional and the default values will apply unless otherwise specified.

##### Density

`density` is multiplied by the area of the body's shape to determine its mass. This parameter is based on a standard value of `1.0` for water, so materials that are lighter than water (such&nbsp;as&nbsp;wood) have a density below `1.0`, and heavier materials (such&nbsp;as&nbsp;stone) have a density greater than `1.0`. However, feel free to set density values to whatever feels right for your simulation, since overall object behavior will also depend on the gravity and <nobr>pixels-to-meter</nobr> scale settings (see&nbsp;[Physics&nbsp;Setup][guide.physics.physicsSetup]). The default value is `1.0`.

##### Friction

`friction` may be any non-negative value. A value of `0.0` means no friction and `1.0` means fairly strong friction. The default value is `0.0`.

##### Bounce

`bounce` is the Box2D property known as "restitution," and it determines how much of an object's velocity is returned after a collision. Values greater than `0.3` are fairly "bouncy," and an object with a bounce value of `1.0` will rebound forever — for example, if the object is dropped to the ground, it will bounce back up to approximately the height from which it was dropped. Bounce values higher than `1.0` are valid, and they will actually gain velocity with each collision. The default value is `0.2`, which is slightly bouncy.

``````lua
--examples:

local crate = display.newImage( "crate.png", 100, 200 )
physics.addBody( crate, { density=1.0, friction=0.3, bounce=0.2 } )

local balloon = display.newImage( "balloon.png", 200, 200 )
physics.addBody( balloon, { density=0.1, friction=0.1, bounce=0.4 } )
``````

Note that a pre-declared table of physical attributes can be used multiple times:

``````lua
local crate1 = display.newImage( "crate1.png", 100, 200 )
local crate2 = display.newImage( "crate2.png", 180, 280 )
 
local crateMaterial = { density=1.0, friction=0.3, bounce=0.2 }
 
physics.addBody( crate1, crateMaterial )
physics.addBody( crate2, crateMaterial )
``````

<a id="bodytype"></a>

### Body Type

Physical bodies can be one of three types: __dynamic__, __static__, or __kinematic__.

##### dynamic

Dynamic bodies are fully simulated. They can be moved manually in code, but normally they move according to forces like gravity or reactionary collision forces. This is the default body type for physical objects in Box2D. Dynamic bodies can collide with all body types.

##### static

Static bodies does not move under simulation and they behave as if they have infinite mass. Static bodies can be moved manually by the user, but they do not accept the application of velocity. Static bodies collide only with dynamic bodies, not with other static bodies or kinematic bodies.

##### kinematic

Kinematic bodies move under simulation only according to their velocity. Kinematic bodies will __not__ respond to forces like gravity. They can be moved manually by the user, but normally they are moved by setting their velocities. Kinematic bodies collide only with dynamic bodies, not with other kinematic bodies or static bodies.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

As noted, some body types will — or will not — collide with other body types. In a collision between two physical objects, at least __one__ of the objects must be dynamic, since this is the only body type which collides with any other type.

</div>

Declaring the body type in Corona is done either inline with the `physics.addBody()` call or post-creation using [object.bodyType][api.type.Body.bodyType].

``````lua
--inline:
physics.addBody( triangle, "static", { density=1.6, friction=0.5, bounce=0.2 } )

--post-creation:
physics.addBody( triangle, { density=1.6, friction=0.5, bounce=0.2 } )
triangle.bodyType = "static"
``````

### Rectangular Bodies

By default, the `physics.addBody()` constructor will apply a rectangular body that surrounds the edges of the associated image or vector object. This is useful for platforms, large ground bodies, and other simple rectangular objects. Note that this rectangle includes the transparent pixels around an image, if any exist.

``````lua
local platform = display.newImage( "platform.png", 600, 200 )
physics.addBody( platform, { density=1.0, friction=0.3, bounce=0.2 } )
``````

If you don't want the physical body to match this bounding rectangle, you must define more specific shape data using either the circular `radius` property or a table of polygon coordinates (see&nbsp;below).

When in doubt, use [physics.setDrawMode()][api.library.physics.setDrawMode] to check how the physics engine is actually considering the object.

### Circular Bodies

Circular bodies are created by adding the `radius` parameter to the properties table. This works well for balls, rocks, and other objects that can be considered approximately round when calculating collisions.

``````lua
local ball = display.newImage( "ball.png", 100, 100 )
physics.addBody( ball, { radius=50, density=1.0, friction=0.3, bounce=0.2 } )
``````

Note that a non-circular oval does not exist in Box2D collision geometry, since circular bodies exist as a special case. To make an oval body, consider a table of polygon coordinates (see&nbsp;below).

<a id="polygonal"></a>

### Polygonal Bodies

Polygonal bodies can be created using the `shape` parameter. This is a Lua table of __x__ and __y__ coordinate pairs, where each pair defines a vertex point for the shape. These coordinates are specified relative to the __center__ of the display object — thus, with `(0,0)` corresponding to the center of the object, a vertex point of `(-20,-10)` defines a point 20 pixels to the left of center and 10 pixels above center.

``````lua
--triangle:
local triangle = display.newImage( "triangle.png" )
triangle.x = 200
triangle.y = 150

--define the shape table (once created, this can be used multiple times)
local triangleShape = { 0,-35, 37,30, -37,30 }

physics.addBody( triangle, { shape=triangleShape, density=1.6, friction=0.5, bounce=0.2 } )


--pentagon:
local pentagon = display.newImage( "pentagon.png" )
pentagon.x = 200
pentagon.y = 50

local pentagonShape = { 0,-37, 37,-10, 23,34, -23,34, -37,-10 }

physics.addBody( pentagon, { shape=pentagonShape, density=3.0, friction=0.8, bounce=0.3 } )
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* Vertex points must be defined in __clockwise__ order. The body may appear correct in the `hybrid` or `debug` views even if you specify the vertex points in <nobr>counter-clockwise</nobr> order, but collisions will not function properly.

* Polygonal shapes must be entirely __convex__. You cannot create shapes with concave bends, for example a bowl or cup. To accomplish such a task, you must assemble the body from multiple polygons, as explained in [Multi-Element Bodies](#multielement) below.

* Polygonal shapes may have a maximum of __8 vertex points__ and thus a maximum of 8&nbsp;sides. If more are required, you must assemble the body from multiple neighboring polygons.

</div>

<a id="multielement"></a>

### Multi-Element Bodies

The above examples assume a body with only one element — either a rectangle, circle, or convex polygon. However, in more advanced situations, you will need to construct bodies from __multiple__ polygons to achieve more precise collision boundaries. Also, since polygons in Box2D must be __convex__, any object with a concave shape must be constructed by assembling multiple body elements.

When creating multi-element bodies, each element must be specified as a separate [polygonal&nbsp;shape](#polygonal). Although these shapes are declared individually, they will be regarded as part of the overall body and they will not shift/flex independently under the application of physical forces.

The constructor for a multi-element body is essentially the same as the simple polygon constructor — just declare the additional elements after the first:

``````lua
physics.addBody( object, "static",
	{ bodyElement1 },
	{ bodyElement2 },
	--etc.
)
``````

Note that each body element may have its own unique physical properties along with the shape definition for its collision boundaries. For example:

``````lua
local car = display.newImage( "car.png" )
local roofShape = { -20,-10, 20,-10, 20,10, -20,10 }
local hoodShape = { 0,-35, 37,30, -37,30 }
local trunkShape = { 0,-37, 37,-10, 23,34, -23,34, -37,-10 }

physics.addBody( car, "dynamic",
	{ density=3.0, friction=0.5, bounce=0.2, shape=roofShape },
	{ density=6.0, friction=0.6, bounce=0.4, shape=hoodShape },
	{ density=4.0, friction=0.5, bounce=0.4, shape=trunkShape }
)
``````

### Offset/Angled Rectangular Bodies

If you want to create a rectangular body that doesn't span the full width and height of the display object, you can define the `box` parameter and specify the desired <nobr>key-value</nobr> pairs within it. This type of body can also be offset from the display object's center and/or set to an angle (rotation) other than `0`.

* `halfWidth` &mdash; Half of the body width. This property is required.
* `halfHeight` &mdash; Half of the body height. This property is required.
* `x` &mdash; The __x__ offset (&plusmn;) from the display object's center. This property is optional and defaults to `0`.
* `y` &mdash; The __y__ offset (&plusmn;) from the display object's center. This property is optional and defaults to `0`.
* `angle` &mdash; The angle (rotation) of the body. This property is optional and defaults to `0`.

`````lua
local body = display.newRect( 100, 200, 40, 40 )

local offsetRectParams = { halfWidth=5, halfHeight=10, x=10, y=0, angle=60 }

physics.addBody( body, "dynamic", { box=offsetRectParams } )
`````

### Edge Shape (Chain) Body

Edge shape (chain) bodies can be defined via an array of vertices in the `chain` table. Edge shapes are not restricted to convex angles like polygonal bodies.

Optionally, you can connect (close) the ends of the chain with the boolean `connectFirstAndLastChainVertex` parameter. If set to `true`, the first and last vertices will be joined by a straight line. If set to `false` (default), the edge shape will have disconnected ends.

`````lua
local body = display.newRect( 150, 200, 40, 40 )

physics.addBody( body, "static",
	{
		chain={ -120,-140, -100,-90, -80,-60, -40,-20, 0,0, 40,0, 70,-10, 110,-20, 140,-20, 180,-10 },
		connectFirstAndLastChainVertex = true
	}
)
`````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

You should not construct an edge shape body with <nobr>self-intersecting</nobr> segments&nbsp;&mdash; in other words, your definition of vertices should not result in any segments of the chain intersecting with other segments. Doing so many break the expected collision detection of the shape.

</div>

### Outline Bodies

If you don't want to define a specific body shape or multi-element body for a more complex display object, Corona can outline the display object automatically via the [graphics.newOutline()][api.library.graphics.newOutline] function. Outlined bodies have fewer restrictions than polygonal bodies, for example, an outlined body shape can be either convex or concave.

`````lua
local image_name = "star.png"

local image_outline = graphics.newOutline( 2, image_name )

local image_star = display.newImageRect( image_name )

physics.addBody( image_star, { outline=image_outline } )
`````



<a id="destroy"></a>

## Destroying Bodies

Physical bodies can be destroyed like other display objects, using either [object:removeSelf()][api.type.DisplayObject.removeSelf] or [display.remove()][api.library.display.remove]. In this case, the object will be removed from both the visible screen __and__ the physical simulation (the physical body data will be destroyed).

``````lua
object:removeSelf()
--OR:
display.remove( object )
``````

Alternatively, you can use [physics.removeBody()][api.library.physics.removeBody] to remove just the physical body while retaining the core display object on screen:

``````lua
physics.removeBody( object )
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

In both cases, the Box2D body will be safely retained until the end of the current world step. However, its Lua reference will be deleted immediately. Therefore, you should avoid accidental, multiple removal of the same Lua object. This may arise when handling object collisions which can potentially trigger multiple event phases before the collision is fully resolved. To prevent this from occurring, use conditional filtering of the `event.phase`, for example:

``````lua
local function onCollision( self, event )

	if ( event.phase == "began" ) then
		display.remove( crate1 )
		crate1 = nil
	end
end
``````

</div>




<a id="sensors"></a>

## Sensors

Any body — or any specific element of a multi-element body — can be turned into a sensor. Sensors do not physically interact with other bodies, but they produce [collision][guide.physics.collisionDetection] events when other bodies pass through them. This is useful if you need to detect when an object collides with a specific region (the&nbsp;sensor), but not cause any force reaction as a result.

Setting a body element as a sensor is done either inline with the `physics.addBody()` call or post-creation using [object.isSensor][api.type.Body.isSensor].

``````lua
--inline:
physics.addBody( goal, "static", { isSensor=true } )

--post-creation:
physics.addBody( goal, "static" )
goal.isSensor = true
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Objects that collide with a sensor will trigger a `"began"` event phase, just like normal non-sensor objects, and they will also trigger an `"ended"` event phase when they exit the collision bounds of the sensor. In addition, collision events will occur for __each&nbsp;element__ in a <nobr>multi-element</nobr> sensor body.

</div>




<a id="properties"></a>

## Body Properties

In Corona, many of the native Box2D set/get methods have been reduced to simple properties on the display object. The following examples assume that a physical body `object` has been created using one of the constructor methods.

### object.bodyType

[object.bodyType][api.type.Body.bodyType] is a string value for the type of physical body. Possible values include `dynamic`, `static`, or `kinematic`. See the [Body&nbsp;Type](#bodytype) section for details. Note that you cannot change the body type during a collision event, so you must queue this event after a slight, imperceptible delay:

``````lua
local function onCollisionDelay()
	--change the body type
	object.bodyType = "kinematic"
end

timer.performWithDelay( 10, onCollisionDelay )
``````

### object.isAwake

[object.isAwake][api.type.Body.isAwake] is the boolean value for the body's current "awake" state. By default, all physical bodies automatically "sleep" when nothing interacts with them for a couple of seconds, and they stop being simulated until something like a collision wakes them up. This property can either fetch an object's current state or forcibly wake it up.

### object.isSleepingAllowed

[object.isSleepingAllowed][api.type.Body.isSleepingAllowed] is the boolean value for whether the body is ever allowed to sleep. Keeping a body awake has a larger performance overhead and usually it's not necessary because a collision with another body will automatically wake it up. However, forcing a constant awake state is useful in cases such as a tilt gravity simulation, since sleeping bodies do not respond to changes in global gravity.

### object.isBodyActive

[object.isBodyActive][api.type.Body.isBodyActive] is used to set or get the body's current active state. Inactive bodies are not destroyed, but they are removed from the physics simulation and cease to interact with other bodies. Note that you cannot change the body's active state during a collision event, so you must queue this event after a slight, imperceptible delay:

``````lua
local function onCollisionDelay()
	--change the body's active state to false
	object.isBodyActive = false
end

timer.performWithDelay( 10, onCollisionDelay )
``````

### object.isSensor

[object.isSensor][api.type.Body.isSensor] is a write-only boolean property that sets an internal `isSensor=true` property across all elements in the body. See the [Sensors](#sensors) section for more details. Because this property acts across all body elements, it unconditionally overrides any `isSensor` settings on the individual elements.

### object.isFixedRotation

[object.isFixedRotation][api.type.Body.isFixedRotation] is the boolean value for whether the body's rotation should be locked, even if the body is subjected to off-center forces.

### object.gravityScale

[object.gravityScale][api.type.Body.gravityScale] can be used to adjust the gravity effect on a specific body. For example, setting it to `0` makes the body float, even if other objects in the simulation are subject to normal gravity. The default value is `1.0`, meaning normal gravity. You can also set the value higher than normal, but be careful since increased gravity can decrease stability.

``````lua
--make the object float in place, even if the simulation has normal gravity
object.gravityScale = 0
``````

### object.angularVelocity

[object.angularVelocity][api.type.Body.angularVelocity] is the numerical value of the current angular (rotational) velocity, in degrees per second.

### object.angularDamping

[object.angularDamping][api.type.Body.angularDamping] is the numerical value for how much the body's rotation should be damped — as in, how quickly the rotating object will slow down to a full stop in the rotational sense (not&nbsp;linear). The default is `0`, meaning the body will rotate at the same velocity indefinitely.

### object.linearDamping

[object.linearDamping][api.type.Body.linearDamping] is the numerical value for how much the body's linear motion is damped — as in, how quickly the object will slow down to a full stop in the linear sense (not&nbsp;rotational). The default is `0`, meaning the body will move at the same velocity indefinitely.

Note that the application of constant linear velocity is accomplished through the [object:setLinearVelocity()][api.type.Body.setLinearVelocity] method described below, unlike the angular/rotational velocity which is set via the [object.angularVelocity][api.type.Body.angularVelocity] property.

### object.isBullet

[object.isBullet][api.type.Body.isBullet] is the boolean value for whether the body should be treated as a "bullet" in respect to collision detection. Bullets are subject to __continuous__ collision detection rather than periodic detection. This is computationally more expensive, but it can prevent <nobr>fast-moving</nobr> objects from passing through solid barriers.




<a id="methods"></a>

## Body Methods

The following examples assume that a physical body `object` has been created using one of the constructor methods.

### object:setLinearVelocity()

[object:setLinearVelocity()][api.type.Body.setLinearVelocity] sets the __x__ and __y__ components for the body's linear velocity, in pixels per second.

``````lua
object:setLinearVelocity( 2, 4 )
``````

### object:getLinearVelocity()

[object:getLinearVelocity()][api.type.Body.getLinearVelocity] returns the __x__ and __y__ components for the body's linear velocity, in pixels per second. This function takes advantage of the fact that Lua can return multiple values, in this case both linear velocities.

``````lua
local vx, vy = object:getLinearVelocity()
print( "Linear X velocity = " .. vx )
print( "Linear Y velocity = " .. vy )
``````

### object:applyForce()

[object:applyForce()][api.type.Body.applyForce] applies the specified __x__ and __y__ components of a linear force at a given point within world coordinates. If the target point is the body's center of mass, it will tend to push the body in a straight line. If the target point is offset from the center, the body will spin around its center of mass. For symmetrical objects, the center of mass and the center of the object will have the same position:

``````lua
object:applyForce( 500, 2000, object.x, object.y )
``````

### object:applyLinearImpulse()

[object:applyLinearImpulse()][api.type.Body.applyLinearImpulse] is similar to `object:applyForce()`, except that an __impulse__ is a single, momentary jolt of force. See the [Force&nbsp;and&nbsp;Impulse](#forcevsimpulse) notes below. Like `object:applyForce()`, the impulse can be applied to any point on the body (either the center of mass or an offset point).

``````lua
object:applyLinearImpulse( 60, 20, object.x, object.y )
``````

### object:applyTorque()

[object:applyTorque()][api.type.Body.applyTorque] applies a rotational force to the body. Positive values will result in clockwise torque; negative values will result in counter-clockwise torque. The body will rotate about its center of mass.

### object:applyAngularImpulse()

[object:applyAngularImpulse()][api.type.Body.applyAngularImpulse] is similar to `object:applyTorque()`, except that an __impulse__ is a single, momentary jolt of force. See the [Force&nbsp;and&nbsp;Impulse](#forcevsimpulse) notes below.

### object:resetMassData()

[object:resetMassData()][api.type.Body.resetMassData] is useful if the default mass data for the body has been overridden. This function resets it to the mass calculated from the shapes.

<div class="guide-notebox">
<div class="notebox-title">Force and Impulse</div>

A common question is whether to apply __force__ or __impulse__ to a body. The difference is that an impulse is meant to simulate an immediate jolt/kick to the body, while force (and&nbsp;torque) is something exerted over time. Therefore, to get a realistic force/torque simulation, you should continually apply it on every application cycle, for as long as you want the force to continue. You can use a Runtime [enterFrame][api.event.enterFrame] event for this purpose:

``````lua
local object = display.newImageRect( "leaf.png", 40, 40 )
object.x, object.y = 200,200

physics.addBody( object, "dynamic", { radius=20 } )

local function constantForce()
	object:applyForce( 2, -4, object.x, object.y )
	object:applyTorque( 2 )
end

Runtime:addEventListener( "enterFrame", constantForce )
``````

</div>
