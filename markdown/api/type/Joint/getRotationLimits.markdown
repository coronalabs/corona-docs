# object:getRotationLimits()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, getRotationLimits
> __See also__          [object:setRotationLimits()][api.type.Joint.setRotationLimits]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function returns the current negative and positive rotation limits of a `"pivot"` joint.

## Syntax

	joint:getRotationLimits()
	

## Example

``````lua
myJoint.isLimitEnabled = true
myJoint:setRotationLimits( -45, 45 )

local negLimit, posLimit = myJoint:getRotationLimits()
print( negLimit, posLimit )
``````
