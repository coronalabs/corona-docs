# object.motorSpeed

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, motorSpeed
> __See also__          [object.isMotorEnabled][api.type.Joint.isMotorEnabled]
>								[object.motorForce][api.type.Joint.motorForce]
>								[object.maxMotorForce][api.type.Joint.maxMotorForce]
>								[object.maxMotorTorque][api.type.Joint.maxMotorTorque]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Numerical value which specifies the rotational motor speed for a `"pivot"` joint, or the linear motor speed for a `"piston"` joint.

## Example

``````lua
if ( myJoint.isMotorEnabled ) then
	myJoint.motorSpeed = 100
end
``````