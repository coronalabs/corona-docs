# object:getLimits()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, getLimits
> __See also__          [object:setLimits()][api.type.Joint.setLimits]
>								[object.isLimitEnabled][api.type.Joint.isLimitEnabled]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function returns the current negative and positive motion limits for a `"piston"` joint.

## Syntax

	joint:getLimits()

## Example

``````lua
myJoint.isLimitEnabled = true 
myJoint:setLimits( 100, 200 )

local negLimit, posLimit = myJoint:getLimits()
print( negLimit, posLimit )
``````