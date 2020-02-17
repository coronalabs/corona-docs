# object.maxForce

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, maxForce
> __See also__          [object.maxTorque][api.type.Joint.maxTorque]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Applies only to `"friction"` and `"touch"` joints.

For a `"friction"` joint, this specifies the maximum directional friction which may be applied to the joined body. Thus, a higher value simulates higher friction.

For a `"touch"` joint, this specifies the maximum allowed force for the touch joint. By default, this attribute is 1000 &times; the mass of the body, allowing for fairly rapid target following.