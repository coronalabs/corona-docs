# object:getTarget()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, getTarget
> __See also__          [object:setTarget()][api.type.Joint.setTarget]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the current target coordinates of a `"touch"` joint as specified by [object:setTarget()][api.type.Joint.setTarget].

## Syntax

	object:getTarget()
	

## Example

``````lua
myJoint:setTarget( 100, 225 )

local tx, ty = myJoint:getTarget()
print( tx, ty )
``````