
# physics.newJoint()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Joint][api.type.Joint]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, joints, newJoint
> __See also__			[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Joints can be used to assemble complex physical objects from multiple rigid bodies. For example, joints can be used to join the limbs of a ragdoll figure, attach the wheels of a vehicle to its body, create a moving elevator platform, and more.

Most joints are used to connect two rigid physical bodies, so you must create these bodies first and then submit them as arguments to this constructor function, along with other properties that vary depending on the joint type.

See the [Physics Joints][guide.physics.physicsJoints] guide to study the various joint types.


## Gotchas

Some joints may be unstable due to the fact that Box2D uses continuous physics. You can turn this off using [physics.setContinuous()][api.library.physics.setContinuous].

This call cannot be used in a collision event. However, your collision handler may set a flag or include a time delay via [timer.performWithDelay()][api.library.timer.performWithDelay] so that the action can occur in the next application cycle or later. See the [Collision&nbsp;Detection][guide.physics.collisionDetection] guide for a complete list of which APIs and methods are subject to this rule.


## Syntax

	physics.newJoint( jointType, ... )

##### jointType ~^(required)^~
_[String][api.type.String]._ One of the following joint types. See the [Physics Joints][guide.physics.physicsJoints] guide to study the various joint types.

* `"pivot"`
* `"distance"`
* `"piston"`
* `"friction"`
* `"weld"`
* `"wheel"`
* `"pulley"`
* `"touch"`
* `"rope"`
* `"gear"`


## Destroying Joints

If a joint is no longer needed, you can destroy it by calling either [object:removeSelf()][api.type.Joint.removeSelf] or [display.remove()][api.library.display.remove]:

``````lua
joint:removeSelf()

--OR:

display.remove( joint )
``````

Note that if one of the joined bodies is destroyed, the associated joint will be automatically destroyed. However, remember to properly remove and `nil` any references to a joint which has been destroyed.