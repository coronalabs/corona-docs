
# physics.setDrawMode()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, draw mode, debug, hybrid
> __See also__          [physics.start()][api.library.physics.start]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets one of three possible "rendering&nbsp;modes" for the physics engine. While this feature will run on devices, it's most useful in the Corona&nbsp;Simulator when testing/debugging physics behavior.

In `"hybrid"` or `"debug"` mode, physics data is displayed using colored vector graphics which reflect different object body types and attributes. See the [Physics Bodies][guide.physics.physicsBodies#body-type] guide for details on body types.

<div class="inner-table">

Outline&nbsp;Color		Physical&nbsp;Type
----------------------	----------------------
orange					Dynamic physics bodies
dark blue				Kinematic physics bodies
green					Static, <nobr>non-movable</nobr> physics bodies
gray					Bodies which are "sleeping" due to lack of activity
light blue				Physical&nbsp;joints <nobr>(see the [Physics Joints][guide.physics.physicsJoints] guide)</nobr>

</div>


## Gotchas

When working with Corona [display&nbsp;groups][guide.start.displayGroups] and Box2D, it's important to remember that Box2D expects all physics objects to share a __global&nbsp;coordinate&nbsp;system__. Both grouped and ungrouped display objects will work well since they will share the internal coordinates of that group. However, unexpected results will occur if physical objects are added to different display groups and those groups are moved, scaled, or rotated independently of each other. As a general rule, do __not__ alter the position, scale, or rotation of display groups that contain physics objects.


## Syntax

	physics.setDrawMode( mode )

##### mode ~^(required)^~
_[String][api.type.String]._ The draw mode, which can be any of the following:

* `"normal"`
* `"hybrid"`
* `"debug"`


## Example

``````lua
physics.setDrawMode( "normal" )  -- The default Corona renderer (no collision outlines)
physics.setDrawMode( "hybrid" )  -- Overlays collision outlines on normal display objects
physics.setDrawMode( "debug" )   -- Shows collision engine outlines only
``````
