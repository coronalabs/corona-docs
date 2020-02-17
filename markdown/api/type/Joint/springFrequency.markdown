# object.springFrequency

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, springFrequency
> __See also__          [object.springDampingRatio][api.type.Joint.springDampingRatio]
>								[Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Applies only to `"wheel"` joints. This value specifies the <nobr>mass-spring</nobr> damping frequency in Hz. A low value will decrease simulated suspension.

## Gotchas

This value must be greater than `0`.
