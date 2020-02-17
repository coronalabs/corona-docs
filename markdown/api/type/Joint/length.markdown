# object.length

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [Joint][api.type.Joint]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          joint, length
> __See also__          [Physics Joints][guide.physics.physicsJoints] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Defines the distance between the anchor points for a `"distance"` joint, which should not be zero or very short. If you position the bodies before applying a distance joint to them, this length will automatically be set as the distance between the anchor points, so it's usually not necessary to set this parameter.