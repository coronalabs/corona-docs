# object.length2

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, length2
> __See also__          [object.length1][api.type.Joint.length1]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Read-only value that, upon instantiation of a `"pulley"` joint, indicates the distance in pixels between the second anchor point and its stationary pulley anchor point.

## Example

``````lua
local pulleyJoint = physics.newJoint( "pulley", bodyA, bodyB, anchorA_x, anchorA_y, anchorB_x, anchorB_y, bodyA.x, bodyA.y, bodyB.x, bodyB.y, 1.0 )
 
print( pulleyJoint.length1 )
print( pulleyJoint.length2 )
print( pulleyJoint.ratio )
``````