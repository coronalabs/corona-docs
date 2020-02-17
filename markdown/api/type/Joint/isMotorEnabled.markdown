# object.isMotorEnabled

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, isMotorEnabled
> __See also__          [object.motorSpeed][api.type.Joint.motorSpeed]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Boolean value which indicates whether a `"pivot"` or `"piston"` joint is <nobr>motor-enabled</nobr> or not. Motor action for a `"pivot"` joint is rotational, while motor action for a `"piston"` joint is linear along the defined axis.

## Example

``````lua
if ( myJoint.isMotorEnabled ) then
	myJoint.motorSpeed = 100
end
``````