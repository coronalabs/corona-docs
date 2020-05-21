# Physics Setup

This guide discusses how to set up Box2D physics in your Corona app. Physics are commonly used for apps that involve a simulation of objects that move, collide, and interact under various physical forces like gravity.

<div class="guides-toc">

* [Overview](#overview)
* [Physics Setup](#setup)
* [Simulation Options](#options)

</div>


<a id="overview"></a>

## Overview

Corona makes it very easy to add physics to your apps, even if you've never worked with a physics engine before. While the underlying engine is built around the popular Box2D, we've taken a different design approach which eliminates a lot of the coding that is traditionally required.

To work with the Corona physics engine, just begin with familiar Corona [display&nbsp;objects][guide.media.displayObjects]. Corona treats physical body properties as an extension of its graphics objects: any standard display object including images, vector objects, or animated sprites can be "made&nbsp;physical" and they will automatically interact with other objects in the simulation.

Note that Corona automatically translates between its familiar onscreen units and the internal metric units of the physical simulation. All position values are exposed in pixels which are converted internally to meters at a default ratio of 30 pixels-per-meter. For further consistency, all angular values are exposed in degrees rather than radians, and position `(0,0)` remains at the top left corner of the content area.




<a id="setup"></a>

## Physics Setup

To begin using physics, you must require the library. The following line makes the physics engine available under the `physics` namespace:

``````lua
local physics = require( "physics" )
``````

### Start / Pause / Stop

The following functions start, pause, and stop the physics simulation:

* [physics.start()][api.library.physics.start] — either instantiates or resumes the simulation (if&nbsp;paused). You __must__ start the physics simulation before calling any other physics functions in this guide.

* [physics.pause()][api.library.physics.pause] — pauses the physics simulation.

* [physics.stop()][api.library.physics.stop] — this is treated as a request to "destroy" the physics world. If you merely want to pause the physics engine, use [physics.pause()][api.library.physics.pause].

``````lua
physics.start()  -- Do this before any other physics call(s)
 
physics.pause()
physics.stop()
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

When working with Corona [display&nbsp;groups][guide.graphics.group] and Box2D, it's important to remember that Box2D expects all physics objects to share a __global&nbsp;coordinate&nbsp;system__. Both grouped and ungrouped display objects will work well since they will share the internal coordinates of that group. However, unexpected results will occur if physical objects are added to different display groups and those groups are moved, scaled, or rotated independently of each other. As a general rule, do __not__ alter the position, scale, or rotation of display groups that contain physics objects. See [Physics Notes/Limitations][guide.physics.limitations]

</div>

### Sleeping Bodies

By default, physical bodies not involved in a collision will "sleep" after a few seconds. This reduces performance overhead, but in some cases you may not want this behavior. This is particularly true in apps that use the accelerometer to effect changes in physics gravity — in this case, sleeping bodies will not respond to changes in the direction of gravity.

You can override this behavior on any given body with the `body.isSleepingAllowed = false` command ([reference][api.type.Body.isSleepingAllowed]), or override it globally for __all__ bodies in the world by using an optional boolean parameter in `physics.start()`:

``````lua
physics.start( true )   -- Prevent all bodies from sleeping

physics.start( false )  -- Default behavior; bodies may sleep after a few seconds
``````

<a id="options"></a>

## Simulation Options

The physics engine features several global simulation options. These can be used to fine-tune your physics simulation beyond the default behavior.

### physics.setGravity()

[physics.setGravity()][api.library.physics.setGravity] sets the __x__ and __y__ components of the global gravity vector, in units of m/s&sup2;. The default is `( 0, 9.8 )` to simulate standard Earth gravity, pointing downward on the __y__ axis.

``````lua
physics.setGravity( 0, 6 )
``````

### physics.setScale()

[physics.setScale()][api.library.physics.setScale] sets the internal pixels-per-meter ratio that is used in converting between on-screen Corona coordinates and simulated physics coordinates. This should be done only once, before any physical objects are instantiated.

Changing this value has no visual consequences — it simply affects the accuracy of the physical model. The Box2D engine is tuned for simulating medium-sized objects between 0.1m and 10m in size, so it works best when the objects in your game are mapped to physical properties that fall roughly within this range.

The default scaling value is `30`, which means that the optimal 0.1m to 10m range corresponds to visible objects between 3 and 300 pixels in size. For larger objects, you may wish to increase this value to `60` or more.

``````lua
physics.setScale( 60 )
``````

You may also want to increase this value if the objects you are simulating seem too sluggish or react too slowly. In this case, they are likely too big and heavy for your purposes — try raising the scale value and/or reduce their densities.

### physics.setDrawMode()

[physics.setDrawMode()][api.library.physics.setDrawMode] sets one of three possible "rendering&nbsp;modes" for the physics engine. While this feature will run on devices, it's most useful in the Corona Simulator when debugging unexpected physics engine behavior.

``````lua
physics.setDrawMode( "hybrid" )  -- Overlays collision outlines on normal display objects
physics.setDrawMode( "normal" )  -- The default Corona renderer, with no collision outlines
physics.setDrawMode( "debug" )   -- Shows collision engine outlines only
``````

Physics data is displayed using colored vector graphics which reflect different object types and attributes. See the [Physics&nbsp;Bodies][guide.physics.physicsBodies] guide for details.

* orange — dynamic physics bodies
* dark blue — kinematic physics bodies
* green — static, non-moveable physics bodies
* gray — a body that is "sleeping" due to lack of activity
* light blue — physical joints (see the [Physics Joints][guide.physics.physicsJoints] guide)

### physics.setPositionIterations()

[physics.setPositionIterations()][api.library.physics.setPositionIterations] sets the accuracy of the engine's position calculations.

``````lua
physics.setPositionIterations( 6 )
``````

The default value is `3`, which means that the engine will iterate through eight position approximations per frame for each object. Increasing this number will cause fewer momentary inaccuracies like overlapping objects, but it will increase computational overhead. The default value should work for most general cases.

### physics.setVelocityIterations()

[physics.setVelocityIterations()][api.library.physics.setVelocityIterations] sets the accuracy of the engine's velocity calculations.

``````lua
physics.setVelocityIterations( 16 )
``````

The default value is `8`, which means that the engine will iterate through three velocity approximations per frame for each object. Increasing this number will cause fewer momentary inaccuracies like overlapping objects, but it will increase computational overhead. The default value should work for most general cases.

### physics.setContinuous()

[physics.setContinuous()][api.library.physics.setContinuous] controls whether continuous physics is enabled or not. By default, Box2D performs continuous collision detection, which prevents objects from "tunneling." If it were turned off, an object that moves quickly enough could potentially pass through a thin wall.

In certain complex situations where bodies are connected by pivot joints (ragdolls, for example), instability can occur. One way to solve this is to turn up the number of velocity iterations using [physics.setVelocityIterations()][api.library.physics.setVelocityIterations]. However, this can be computationally expensive and reduce frame rates. Another solution is to __disable__ continuous physics:

``````lua
physics.setContinuous( false )
``````

Turning it off should prevent the instability without increasing iterations. However, you'll need to make your static bodies extra thick to prevent tunneling effects.

### physics.setAverageCollisionPositions()

[physics.setAverageCollisionPositions()][api.library.physics.setAverageCollisionPositions] enables the averaging of all contact points in a [collision][guide.physics.collisionDetection] between physics bodies. Because it's common for Box2D to report multiple collision points during a single frame iteration, this setting is useful to report those points as one averaged point.

``````lua
physics.setAverageCollisionPositions( true )
``````

### physics.setReportCollisionsInContentCoordinates()

[physics.setReportCollisionsInContentCoordinates()][api.library.physics.setReportCollisionsInContentCoordinates] sets the content origin as the reference point in the [collision][api.event.collision], [preCollision][api.event.preCollision], and [postCollision][api.event.postCollision] physics events.

``````lua
physics.setReportCollisionsInContentCoordinates( true )
``````

### physics.setDebugErrorsEnabled()

[physics.setDebugErrorsEnabled()][api.library.physics.setDebugErrorsEnabled] allows extra physics errors to be caught by Box2D. Default is `true` (enabled).

### physics.setTimeStep()

[physics.setTimeStep()][api.library.physics.setTimeStep] specifies either a frame-based (approximated) physics simulation or a time-based simulation.

``````lua
physics.setTimeStep( 0 )  -- Time-based physics simulation
``````

### physics.setMKS()

[physics.setMKS()][api.library.physics.setMKS] sets the MKS (meters, kilograms, and seconds) value of the physics simulation for specific keys. This is strictly for advanced purposes — the average developer and project will not require this function.
