# object:getGroundAnchorA()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          getGroundAnchorA
> __See also__          [object:getGroundAnchorB()][api.type.Joint.getGroundAnchorB]
>						[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the __x__ and __y__ coordinates of a `"pulley"` joint's first ground anchor in content coordinates.


## Syntax

	joint:getGroundAnchorA()

## Example

``````lua
local agx, agy = myJoint:getGroundAnchorA()
``````