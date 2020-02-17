# object.bodyType

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, bodyType, dynamic, static, kinematic
> __See also__          [physics.addBody()][api.library.physics.addBody]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string value for the type of physical body being simulated. Possible values include:

* `"dynamic"` &mdash; dynamic bodies are fully simulated. They can be moved manually in code, but normally they move according to forces like gravity or reactionary collision forces. This is the default body type for physical objects in Box2D. Dynamic bodies can collide with all body types.

* `"static"` &mdash; static bodies does not move under simulation and they behave as if they have infinite mass. Static bodies can be moved manually by the user, but they do not accept the application of velocity. Static bodies collide only with dynamic bodies, not with other static bodies or kinematic bodies.

* `"kinematic"` &mdash; kinematic bodies move under simulation only according to their velocity. Kinematic bodies will not respond to forces like gravity. They can be moved manually by the user, but normally they are moved by setting their velocities. Kinematic bodies collide only with dynamic bodies, not with other kinematic bodies or static bodies.

## Gotchas

This call cannot be used in a collision event. However, your collision handler may set a flag or include a time delay via [timer.performWithDelay()][api.library.timer.performWithDelay] so that the action can occur in the next application cycle or later. See the [Collision Detection][guide.physics.collisionDetection] guide for a complete list of which APIs and methods are subject to this rule.

## Example

``````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 100, 100 )
 
-- Add a body to the rectangle
physics.addBody( myRect, { isSensor = false } )
 
-- Set the body's type to kinematic
myRect.bodyType = "kinematic"
``````
