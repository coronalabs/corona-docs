# object:setLimits()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, setLimits
> __See also__          [object:getLimits()][api.type.Joint.getLimits]
>								[object.isLimitEnabled][api.type.Joint.isLimitEnabled]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function accepts two values which define the negative and positive range of motion for a `"piston"` joint. The second value should always be greater than or equal to the first value, since they define a range of motion (distance) along the axis.

## Syntax

	joint:setLimits( negLimit, posLimit )
	
##### negLimit, posLimit ~^(required)^~
_[Numbers][api.type.Number]._ Negative and positive values for the range of linear motion.


## Example

``````lua
myJoint.isLimitEnabled = true
myJoint:setLimits( 100, 200 )
``````