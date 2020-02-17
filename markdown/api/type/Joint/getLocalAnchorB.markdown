# object:getLocalAnchorB()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, getLocalAnchorB
> __See also__          [object:getLocalAnchorA()][api.type.Joint.getLocalAnchorA]
>								[object:getAnchorA()][api.type.Joint.getAnchorA]
>								[object:getAnchorB()][api.type.Joint.getAnchorB]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the __x__ and __y__ coordinates of the joint's anchor point within object `B`, where `A` and `B` are the two joined bodies. Values are relative (local) to object `B`.

## Gotchas

Does not apply to `"touch"` or `"pulley"` joints.

## Syntax

	joint:getLocalAnchorB()

## Example

``````lua
local bx, by = myJoint:getLocalAnchorB()
``````