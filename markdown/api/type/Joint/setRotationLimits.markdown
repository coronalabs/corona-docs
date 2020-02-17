# object:setRotationLimits()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, setRotationLimits
> __See also__          [object:getRotationLimits()][api.type.Joint.getRotationLimits]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function accepts two values, in degrees, defining the negative and positive limits of rotation for a `"pivot"` joint. For example, if you want to limit the rotation somewhat tightly in relation to the upward axis (`0`), these values may be `-10` and `10` respectively. Note that these values remain in relation to the rotation of body `A`, meaning that if body `A` rotates after the joint is declared, these rotation limits will remain in rotational synchronization with that body.

## Syntax

	joint:setRotationLimits( negLimit, posLimit )
	
##### negLimit, posLimit ~^(required)^~
_[Numbers][api.type.Number]._ The negative and positive limits of rotation, in degrees from `0`.

## Example

``````lua
myJoint.isLimitEnabled = true
myJoint:setRotationLimits( -10, 10 )
``````