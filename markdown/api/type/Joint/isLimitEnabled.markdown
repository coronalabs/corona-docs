# object.isLimitEnabled

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, isLimitEnabled
> __See also__          [object:setRotationLimits()][api.type.Joint.setRotationLimits]
>								[object:setLimits()][api.type.Joint.setLimits]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Set this to `true` to constrain the limits of rotation for a `"pivot"` joint or the limits of motion for a `"piston"` joint.

## Examples

``````lua
pivotJoint.isLimitEnabled = true
pivotJoint:setRotationLimits( -10, 10 )
``````

``````lua
pistonJoint.isLimitEnabled = true
pistonJoint:setLimits( -40, 120 )
``````