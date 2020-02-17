# object.ratio

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, ratio
> __See also__          [object.joint1][api.type.Joint.joint1]
>								[object.joint2][api.type.Joint.joint2]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Applies only to `"pulley"` and `"gear"` joints.

For a `"pulley"` joint, indicates the current joint ratio. For this joint type, this property is <nobr>read-only,</nobr> but the ratio value can be initially set as the final parameter in the joint constructor and adjusted to simulate a block and tackle arrangement. In such a scenario, one side of the pulley rope moves faster than the other. The default ratio is `1.0` which simulates a simple pulley.

For a `"gear"` joint, this property can be either set or read, and it indicates the ratio at which the <nobr>motor-driven</nobr> joint drives the corresponding joint in the gear configuration. This ratio can be either positive or negative, depending on the direction required to create an accurate simulation.

## Examples

``````lua
local pulleyJoint = physics.newJoint( "pulley", bodyA, bodyB, anchorA_x, anchorA_y, anchorB_x, anchorB_y, bodyA.x, bodyA.y, bodyB.x, bodyB.y, 1.0 )
 
print( pulleyJoint.length1 )
print( pulleyJoint.length2 )
print( pulleyJoint.ratio )

``````

``````lua
local gearJoint = physics.newJoint( "gear", bodyA, bodyB, joint1, joint2, 1.0 )
print( gearJoint.ratio )

-- Change gear joint ratio
gearJoint.ratio = 0.4
``````