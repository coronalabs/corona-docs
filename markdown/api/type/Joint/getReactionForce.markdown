# object:getReactionForce()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, getReactionForce
> __See also__          [Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function returns the reaction force in Newtons at the joint anchor in the second body.

## Syntax

	joint:getReactionForce()


## Example

``````lua
local reactionForceX, reactionForceY = myJoint:getReactionForce()
``````
