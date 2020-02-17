# physics.setContinuous()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      None
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, ragdoll, tunneling
> __See also__          [Collision Detection][guide.physics.collisionDetection]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

By default, Box2D performs continuous collision detection, which prevents objects from "tunneling." If it were turned off, an object that moves quickly enough could potentially pass through a thin wall.

In certain complex situations where bodies are connected by pivot joints, instability can occur. One way to solve this is to turn up the number of velocity iterations using [physics.setVelocityIterations()][api.library.physics.setVelocityIterations]. However, this can be computationally expensive and reduce frame rates. Another solution is to __disable__ continuous physics. Doing so should prevent the instability without increasing iterations. However, you'll need to make your static bodies extra thick to prevent tunneling effects.


## Gotchas

This call cannot be used in a collision event. However, your collision handler may set a flag or include a time delay via [timer.performWithDelay()][api.library.timer.performWithDelay] so that the action can occur in the next application cycle or later. See the [Collision&nbsp;Detection][guide.physics.collisionDetection] guide for a complete list of which APIs and methods are subject to this rule.


## Syntax

	physics.setContinuous( enabled )

##### enabled ~^(required)^~
_[Boolean][api.type.Boolean]._ Controls whether continuous physics is enabled or not.


## Examples

``````lua
physics.setContinuous( false )
``````