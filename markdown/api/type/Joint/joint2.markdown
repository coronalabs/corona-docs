# object.joint2

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Userdata][api.type.Userdata]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, joint2
> __See also__          [object.joint1][api.type.Joint.joint1]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Applies only to `"gear"` joints. Read-only reference to the second `"pivot"` or `"piston"` joint associated with the gear joint.

## Example

``````lua
local gearJoint = physics.newJoint( "gear", bodyA, bodyB, joint1, joint2, 1.0 )

print( gearJoint.joint1 )
print( gearJoint.joint2 )
``````