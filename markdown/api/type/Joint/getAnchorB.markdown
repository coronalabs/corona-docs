# object:getAnchorB()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, getAnchorB
> __See also__          [object:getAnchorA()][api.type.Joint.getAnchorA]
>						[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the __x__ and __y__ coordinates of the joint's anchor point within object `B`, where `A` and `B` are the two joined bodies. Values are in content space.

## Syntax

	joint:getAnchorB()


## Example

``````lua
local bx, by = myJoint:getAnchorB()
``````
