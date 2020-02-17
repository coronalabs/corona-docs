# object:getLocalAxisA()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, getLocalAxisA
> __See also__          [Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function returns the current coordinates of the anchor point along the defined axis, in content space.

For use with `"piston"` and `"wheel"` joints.

## Syntax

	joint:getLocalAxisA()

## Example

``````lua
local lax, lay = myJoint:getLocalAxisA()
``````