# object:removeSelf()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, removeSelf
> __See also__          [display.remove()][api.library.display.remove]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Destroys an existing joint and detaches the two joined bodies. This should not be called during a [collision][api.event.collision] event &mdash; instead, set a flag or add a time delay so the destruction can occur in the next application cycle or later, for example via [timer.performWithDelay()][api.library.timer.performWithDelay].

Alternatively, you can destroy a joint via [display.remove()][api.library.display.remove], passing the joint reference as the sole argument.

## Syntax

	object:removeSelf()
