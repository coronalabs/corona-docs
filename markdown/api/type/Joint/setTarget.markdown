# object:setTarget()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, setTarget
> __See also__          [object:getTarget()][api.type.Joint.getTarget]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the current target (follow) point of a `"touch"` joint in content space coordinates. This can be any specific content point, the location of the user's touch, the coordinates of some other object to follow, successive points along a path, etc.

## Syntax

	object:setTarget( targetX, targetY )
	
##### targetX, targetY ~^(required)^~
_[Numbers][api.type.Number]._ The target coordinates in content space.

## Example

``````lua
myJoint:setTarget( 100, 225 )
``````